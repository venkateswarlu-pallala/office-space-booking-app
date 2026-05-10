import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homler/config/routes/routers.dart';
import 'package:homler/core/main/Partners/view/partners.dart';
import 'package:homler/core/main/bookingsDetails/view/bookings_details.dart';
import 'package:homler/core/main/commercialSearch/view/commercial_search.dart';
import 'package:homler/core/main/contactUs/view/contact_us.dart';
import 'package:homler/core/main/support/view/support.dart';

import '../../core/auth/login/view/login_page.dart';
import '../../core/main/aboutUs/view/about_us.dart';
import '../../core/main/bookings/view/bookings.dart';
import '../../core/main/commercialDetails/view/commercial_details.dart';
import '../../core/main/home/view/home_page.dart';
import '../../core/main/marketing/view/marketing.dart';
import '../services/app_state.dart';

class AppRouter {

  static List<GetPage> pages = [
    // ------------------------------------------------------------------------ LAUNCH
    GetPage(
      name: loginRoute.route,
      page: () => const LoginPage(),
      middlewares: [
        PretendAuthMiddleware()
      ],
    ),

    GetPage(
      name: homeRoute.route,
      page: () => const HomePage(),
      middlewares: [
      ],
    ),
    GetPage(
      name: bookingsRoute.route,
      page: () => const Bookings(),
      middlewares: [
        PretendAuthMiddleware()
      ],
    ),
    GetPage(
      name: partnersRoute.route,
      page: () => const Partners(),
      middlewares: [
      ],
    ),
    GetPage(
      name: marketingRoute.route,
      page: () => const Marketing(),
      middlewares: [
      ],
    ),
    GetPage(
      name: aboutUsRoute.route,
      page: () => const AboutUs(),
      middlewares: [
      ],
    ), GetPage(
      name: contactUsRoute.route,
      page: () => const ContactUs(),
      middlewares: [
      ],
    ),
    GetPage(
      name: supportRoute.route,
      page: () => const Support(),
      middlewares: [
      ],
    ),
    GetPage(
      name: commercialSearchRoute.route,
      page: () => const CommercialSearch(),
      middlewares: [
      ],
    ),
    GetPage(
      name: commercialDetailsRoute.route,
      page: () => const CommercialDetails(),
      middlewares: [
      ],
    ),GetPage(
      name: bookingsDetailsRoute.route,
      page: () => const BookingsDetails(),
      middlewares: [
      ],
    ),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AppState.isLogin)  AppState.setPersistenceRoute(route??"/");
    return AppState.isLogin ? null : RouteSettings(name: loginRoute.route);
  }
}

class PretendAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AppState.isLogin ? RouteSettings(name: homeRoute.route) : null;
  }
}
