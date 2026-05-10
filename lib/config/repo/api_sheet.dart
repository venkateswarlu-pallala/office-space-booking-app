

import '../utils/constants.dart';

class ApiSheet {
  static final home = HomeApi();
  static final auth = AuthApi();
  static final user = AuthApi();
}

class HomeApi{
  final String _baseUrl = "$BASE_API/v1/home";

  Uri get homeData => Uri.parse("$_baseUrl/home_data");
  Uri get user => Uri.parse("$_baseUrl/home_data");

}

class AuthApi {
  final String _baseUrl = "$BASE_API/v1/user";

  // POST(domain, token, device)
  Uri get mailLogin => Uri.parse("$_baseUrl/mail_login");

  // POST(mail, password, device)
  Uri get verifyMailLogin => Uri.parse("$_baseUrl/verify_mail_login");

  // GET
  Uri get refreshToken => Uri.parse( "$_baseUrl/refresh_token");

  // GET
  Uri get logout => Uri.parse("$_baseUrl/logout");

  Uri get logoutAll => Uri.parse("$_baseUrl/logout_all");


}