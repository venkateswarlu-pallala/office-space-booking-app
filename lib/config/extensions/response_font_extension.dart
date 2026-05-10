import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

extension ResponsiveFont on num {
  double get sp {
    const double designWidth = 375.0;
    const double tabletWidth = 600.0;

    final double screenWidth = Get.width;
    final double systemScale =
        WidgetsBinding.instance.platformDispatcher.textScaleFactor;

    double base;

    if (screenWidth < tabletWidth) {
      // 📱 MOBILE — DOWN SCALE LARGE TEXT
      if (this >= 36) {
        base = 24;
      } else if (this >= 32) {
        base = 22;
      } else if (this >= 26) {
        base = 20;
      } else if (this >= 18) {
        base = 16;
      } else {
        base = this.toDouble();
      }
    } else {
      // 📲 TABLET / WEB — GENTLE SCALE UP
      double scale = (screenWidth / designWidth).clamp(1.0, 1.2);

      if (this >= 36) {
        base = this * 1.05;
      } else if (this >= 26) {
        base = this * 1.1;
      } else {
        base = this * scale;
      }
    }

    return base * systemScale;
  }
}