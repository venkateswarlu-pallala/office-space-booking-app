import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class Decorations {
  static Decoration? get card => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.light.withAlpha(125),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],

  );
}
