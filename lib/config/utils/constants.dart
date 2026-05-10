import 'package:flutter/material.dart';
import 'package:get/get.dart';

const maxScreen = 1440.0;
const tabScreen = 900.0;
const minScreen = 500.0;

const BASE_API = "https://bookings-api.codesignificant.com";
const IMAGE_BASE = "https://bookings-api.codesignificant.com/storage";

double get kStatusBarHeight => MediaQuery.of(Get.context!).viewPadding.top;

double get kBottomBarHeight => MediaQuery.of(Get.context!).viewPadding.bottom;

void trace(dynamic message) {
  // if (Config.isDev) {
  //   final traceString = StackTrace.current.toString().split('\n')[2];
  //   print('\n---------------\n$traceString\n$message\n========\n');
  // }
}