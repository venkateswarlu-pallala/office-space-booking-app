import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homler/config/routes/routers.dart';
import 'package:homler/config/services/app_state.dart';
import 'package:http/http.dart' as http;
import '../../../../config/repo/api_sheet.dart';
import '../../../../config/utils/validations.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final otpController = TextEditingController();

  bool showOtpField = false;
  bool isLoading = false;

  void _toast(String msg) {
    Get.snackbar("Login", msg);
  }

  Future<void> sendOtp(BuildContext context) async {
    final email = emailController.text.trim();

    if (!Validations.isValidEmail(email)) {
      _toast("Please enter a valid email");
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(ApiSheet.user.mailLogin,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'mail': email}),
      );

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res['success'] ?? false) {
          showOtpField = true;
        }
        else {
          showOtpField = false;
          _toast(res['message']);
        }

        isLoading = false;
        notifyListeners();
      }
    }catch(e){
        _toast("something went wrong");
        print("$e");
      }
  }

  /// Verify OTP and login
  Future<void> verifyOtp(BuildContext context) async {
    final email = emailController.text.trim();
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      _toast("Please enter OTP");
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        ApiSheet.auth.verifyMailLogin,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      if(response.statusCode == 200){
        final res = jsonDecode(response.body);
        if (res['success']??false) {
          _toast("Login successful");
          AppState.setToken(res['token']);
          homeRoute.replace;
        } else {
          _toast(res['message']??"");
        }
      }


    } catch (e) {
      _toast("OTP verification failed: $e");
    }


  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
