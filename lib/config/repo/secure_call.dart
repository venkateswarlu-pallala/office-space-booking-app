import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../routes/routers.dart';
import '../services/app_state.dart';
import 'api_sheet.dart';
import '../utils/data_response.dart';

class SecureCall {
  // ------------------------------
  // Private class-level variables
  // ------------------------------
  static bool _isRefreshing = false;

  static Map<String, String> get getHeaders =>
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppState.token}',
      };

  // ------------------------------
  // Core helper: 401 handling + retry on 5xx
  // ------------------------------
  static Future<http.Response> _withRefresh(
      Future<http.Response> Function() request) async {

    await _waitUntilRefresh();

    http.Response response = await request();

    if (response.statusCode == 401) {
      final refreshResult = await refreshToken();

      if (refreshResult is DataSuccess) {
        return await request();
      } else {
        return http.Response(jsonEncode({
          "success": false,
          "message": "Session expired"
        }), 401);
      }
    }

    return response;
  }


  // ------------------------------
  // Generic try* helper
  // ------------------------------
  static Future<DataResponse<T>> _tryRequest<T>(
      Future<http.Response> Function() request,
      Future<DataResponse<T>> Function(http
          .Response response, dynamic data) onSuccess,) async {
    await _waitUntilRefresh();

    try {
      final response = await request();

      // Unauthorized
      if (response.statusCode == 401) {
        return DataFailed<T>("Unauthorized — login again");
      }

      // HTTP Error
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return DataFailed<T>("Server Error (${response.statusCode})");
      }

      final body = response.body.trim();
      if (body.isEmpty) {
        return DataFailed<T>("Empty response");
      }

      dynamic decoded;
      try {
        decoded = jsonDecode(body);
      } catch (_) {
        return DataFailed<T>("Invalid JSON response");
      }

      // API level failure { success: false }
      if (decoded is Map &&
          decoded.containsKey("success") &&
          decoded["success"] == false) {
        return DataFailed<T>(decoded["message"] ?? "Request failed");
      }

      return await onSuccess(response, decoded);
    } catch (e) {
      return DataFailed<T>("Something went wrong");
    }
  }


  // ------------------------------
  // HTTP methods using _withRefresh
  // ------------------------------
  static Future<http.Response> get(Uri url, {Map<String, String>? headers}) =>
      _withRefresh(() => http.get(url, headers: headers ?? getHeaders));

  static Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _withRefresh(() =>
          http.post(url,
              headers: headers ?? getHeaders, body: body, encoding: encoding));

  static Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _withRefresh(() =>
          http.patch(url,
              headers: headers ?? getHeaders, body: body, encoding: encoding));

  static Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _withRefresh(() =>
          http.put(url,
              headers: headers ?? getHeaders, body: body, encoding: encoding));

  static Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _withRefresh(() =>
          http.delete(url,
              headers: headers ?? getHeaders, body: body, encoding: encoding));

  static Future<http.Response> uploadImage(Uri url,
      String keyName,
      Uint8List file,
      String fileName, {
        Map<String, String>? headers,
        Map<String, String>? body,
        String mimeTypeMain = "image",
        String mimeTypeSub = "jpeg",
      }) =>
      _withRefresh(() async {
        final request = http.MultipartRequest('POST', url);
        request.headers.addAll({
          'Authorization': 'Bearer ${AppState.token}',
          if (headers != null) ...headers,
        });

        if (body != null) request.fields.addAll(body);

        request.files.add(http.MultipartFile.fromBytes(
          keyName,
          file,
          filename: fileName,
          contentType: MediaType(mimeTypeMain, mimeTypeSub),
        ));

        final streamedResponse = await request.send();
        final responseString = await streamedResponse.stream.bytesToString();
        return http.Response(responseString, streamedResponse.statusCode);
      });

  // ------------------------------
  // Generic try* methods
  // ------------------------------
  static Future<DataResponse<T>> tryGet<T>(Uri url, {
    Map<String, String>? headers,
    required Future<DataResponse<T>> Function(
        http.Response response, dynamic res)
    onSuccess,
  }) =>
      _tryRequest(() => get(url, headers: headers), onSuccess);

  static Future<DataResponse<T>> tryPost<T>(Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    required Future<DataResponse<T>> Function(
        http.Response response, dynamic res)
    onSuccess,
  }) =>
      _tryRequest(
              () => post(url, headers: headers, body: body, encoding: encoding),
          onSuccess);

  static Future<DataResponse<T>> tryPatch<T>(Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    required Future<DataResponse<T>> Function(
        http.Response response, dynamic res)
    onSuccess,
  }) =>
      _tryRequest(
              () => patch(url, headers: headers, body: body, encoding: encoding),
          onSuccess);

  static Future<DataResponse<T>> tryPut<T>(Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    required Future<DataResponse<T>> Function(
        http.Response response, dynamic res)
    onSuccess,
  }) =>
      _tryRequest(
              () => put(url, headers: headers, body: body, encoding: encoding),
          onSuccess);

  static Future<DataResponse<T>> tryDelete<T>(Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    required Future<DataResponse<T>> Function(
        http.Response response, dynamic res)
    onSuccess,
  }) =>
      _tryRequest(
              () =>
              delete(url, headers: headers, body: body, encoding: encoding),
          onSuccess);

  static Future<DataResponse<T>> tryUploadFile<T>(Uri url,
      String keyName,
      Uint8List file,
      String fileName, {
        Map<String, String>? headers,
        Map<String, String>? body,
        String mimeTypeMain = "image",
        String mimeTypeSub = "jpeg",
        required Future<DataResponse<T>> Function(
            http.Response response, dynamic res)
        onSuccess,
      }) =>
      _tryRequest(
              () =>
              uploadImage(url, keyName, file, fileName,
                  headers: headers,
                  body: body,
                  mimeTypeMain: mimeTypeMain,
                  mimeTypeSub: mimeTypeSub),
          onSuccess);

  // ------------------------------
  // Refresh token logic
  // ------------------------------
  static Future<DataResponse> refreshToken() async {
    try {
      _isRefreshing = true;
      final res = await http.get(
          ApiSheet.auth.refreshToken,
          headers: getHeaders);
      if (res.statusCode == 200) {
        final refreshRes = jsonDecode(res.body);
        if (!refreshRes['success']) {
          _isRefreshing = false;
          return DataFailed(refreshRes['message'] ?? "");
        }
        await AppState.setToken(refreshRes['token']);
        _isRefreshing = false;
        return const DataSuccess("Refresh Success");
      }

      _isRefreshing = false;
      AppState.clearAuth();
      loginRoute.sweepNavigate;
      await Future.delayed(const Duration(milliseconds: 500));
      return DataFailed("Server Error ${res.statusCode}");
    } catch (e) {
      _isRefreshing = false;
      return const DataFailed("Something went wrong");
    }
  }

  static Future<void> _waitUntilRefresh() async {
    while (_isRefreshing) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}
