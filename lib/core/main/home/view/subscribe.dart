import 'package:flutter/material.dart';
import 'package:homler/config/elements/shimmer.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';


class Subscribe extends StatelessWidget {
  const Subscribe({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all( 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppColors.darkGlowGradient,
      ),
     child: Wrap(
       alignment: WrapAlignment.spaceBetween,
       children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "Stay updated — weekly deals & new spaces",
               style: FontStyles.s18White5,
             ),
             SizedBox(height: 8),
             Text(
               "Subscribe for curated listings and exclusive discounts.",
               style: FontStyles.s10WhiteW5,
             ),
           ],
         ),
         Row(
           children: [
             Shimmer(height: 40, width: 250),
             Shimmer(height: 40, width: 120)
           ],
         )
       ],
     ),
    );
  }
}
