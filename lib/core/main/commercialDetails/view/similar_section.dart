import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
import '../../home/view/cabin_card.dart';
class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Center(
            child: GradientText(
              text: "Similar Ones",
              style: FontStyles.s32Linear4,
              gradient: AppColors.darkGlowGradient,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 377,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.all(10),
                  child: SizedBox(
                    width: 340,
                    child: CabinCard(
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}