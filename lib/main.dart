import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/app_router.dart';
import 'config/routes/routers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      getPages: AppRouter.pages,
      initialRoute: loginRoute.route,
      theme: ThemeData(fontFamily: 'Poppins'
      ),
// home: SeatCard(),


    );
  }
}
