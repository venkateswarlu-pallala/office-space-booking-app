import 'package:flutter/material.dart';

import '../../../../config/elements/amenities/amenities.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
class AmenitiesSection extends StatelessWidget {
  const AmenitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [

          /// TITLE
          Center(
            child: GradientText(
              text: "Amenities",
              style: FontStyles.s32Linear4,
              gradient: AppColors.darkGlowGradient,
              textAlign: TextAlign.center,
            ),
          ),



          const SizedBox(height: 30),

          Wrap(
            spacing: 40,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: Amenities.allFeatures.map((feature) {
              return _amenityItem(
                iconPath: feature["iconPath"]!,
                name: feature["name"]!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
Widget _amenityItem({
  required String iconPath,
  required String name,
}) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 300
    ),
    child: Row(
      children: [

        Image.asset(
          iconPath,
          width:52,
          height: 52,
        ),

         SizedBox(height: 9),

        Text(
          name,
          textAlign: TextAlign.center,
          style: FontStyles.s16Text5,
        ),
      ],
    ),
  );
}