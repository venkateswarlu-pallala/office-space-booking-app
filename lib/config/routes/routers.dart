import 'package:get/get.dart';
import '../utils/basic_enc.dart';

// ---------------------------------------------------------------------------- AUTH
GenerateRoute get initialRoute => GenerateRoute("/");
GenerateRoute get homeRoute => GenerateRoute("/home");
GenerateRoute get loginRoute => GenerateRoute("/login");
GenerateRoute get bookingsRoute => GenerateRoute("/bookings");
GenerateRoute get partnersRoute => GenerateRoute("/partners");
GenerateRoute get marketingRoute => GenerateRoute("/marketing");
GenerateRoute get aboutUsRoute => GenerateRoute("/aboutUs");
GenerateRoute get commercialSearchRoute => GenerateRoute("/commercialSearch");
GenerateRoute get commercialDetailsRoute => GenerateRoute("/commercialDetails");
GenerateRoute get contactUsRoute => GenerateRoute("/contactUs");
GenerateRoute get  supportRoute => GenerateRoute("/support");
GenerateRoute get  bookingsDetailsRoute => GenerateRoute("/bookingsDetails");



// ---------------------------------------------------------------------------- TEST
GenerateRoute get testRoute => GenerateRoute("/test");

GenerateRoute get notFoundRoute => GenerateRoute("/not_found");

void navigate(String? route) {
  if (route == null) return;
  if (route.isEmpty) return;
  Get.toNamed(route);
}

// bool redirect() {
//   if (Auth.redirect.isNotEmpty) {
//     navigate(Auth.redirect);
//     Auth.setRedirect("");
//     return true;
//   }
//   return false;
// }

class GenerateRoute {
  String route;

  GenerateRoute(this.route);

  GenerateRoute param(String param) {
    route += "/$param";
    return this;
  }

  GenerateRoute queryParam(String name, String value) {
    if (route.contains('?')) {
      route += '&$name=$value';
    } else {
      route += '?$name=$value';
    }
    return this;
  }
  GenerateRoute enQueryParam(String name, String value) {
    if (route.contains('?')) {
      route += '&$name=${BasicEnc.encode(value)}';
    } else {
      route += '?$name=${BasicEnc.encode(value)}';
    }
    return this;
  }

  GenerateRoute encParam(String param) {
    route += "/${BasicEnc.encode(param)}";
    return this;
  }

  GenerateRoute key(String param) {
    route += "/:$param";
    return this;
  }

  void get navigate {
    Get.toNamed(route);
  }

  void push(dynamic arguments) {
    Get.toNamed(route, arguments: arguments);
  }

  void get replace {
    Get.offNamed(route);
  }

  void get sweepNavigate {
    Get.offAllNamed(route);
  }

  void until(String untilRoute) {
    Get.offNamedUntil(route, (route) => route.settings.name == untilRoute);
  }
}
