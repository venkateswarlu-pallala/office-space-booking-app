import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CircularProgress extends StatelessWidget {
  final double size;
  final double stroke;
  final Color color;

  const CircularProgress(
      {super.key, this.stroke = 2, this.size = 16, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(color: color, strokeWidth: stroke)),
    );
  }
}
