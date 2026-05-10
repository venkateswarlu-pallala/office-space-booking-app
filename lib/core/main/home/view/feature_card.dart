import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';

import '../../../../config/extensions/response_font_extension.dart';
class FeatureCard extends StatelessWidget {
  final String content;
  final String title;
  final String img;

  const FeatureCard({
    required this.content,
    required this.title,
    required this.img,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 2
          ),
        ],
      ),
      padding: EdgeInsets.all(14.sp),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 48, maxHeight: 48),
            decoration: BoxDecoration(
                gradient: AppColors.darkGlowGradient,
                borderRadius: BorderRadius.circular(48)
            ),
            padding: EdgeInsets.all(12),
            child: Image.asset(img,width: 24,height: 24,
             ),
          ),
           Text(
              title,
              style: FontStyles.s16Text7, textAlign: TextAlign.center,),
           Text(content, style: FontStyles.s14HintW5,
              maxLines: 3,
              textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
