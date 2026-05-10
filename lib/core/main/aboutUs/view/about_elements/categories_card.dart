import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';

class CategoriesCard extends StatelessWidget {
  final double radius;
  final String title;
  final String content;
  final String img;
  final double height;
  final double width;
  final double  maxheight;
  final double maxwidth;
  const CategoriesCard({
    required this.radius,
    required this.title,
    required this.content,
    required this.img,
    required this.height,
    required this.width,
     this.maxheight =262,
     this.maxwidth =371,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 379,
        maxHeight: 568,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryButtonBg,
      ),
      child: Column(
        children: [
          Stack(
            // clipBehavior: Clip.none,
            children: [
              Positioned(
                left:141,
               top: -102,
                child: Transform.rotate(
                  angle: 5 * pi / 180, // -5°
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxheight,
                      maxHeight: maxwidth,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      gradient: AppColors.linearGradient,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 59.5,vertical: 60.5),
                child: Image.asset(
                  img,
                  height: height,width: width,

                ),
              ),
            ],
          ),
          Container(constraints:
            BoxConstraints(
              maxWidth: 379,maxHeight: 163,
            ),
            child: Column(
              children: [
                SizedBox(height: 30,
                child: Text(title,textAlign: TextAlign.center,
                style: FontStyles.s16WhiteW5,),),
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 216,maxHeight: 84
                    ),
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(content,textAlign: TextAlign.center,
                      style: FontStyles.s12whiteW4,),
                    ),
                  ),

                ),
                SizedBox(height: 20,),
            Center(
              child:  Text("View All",textAlign: TextAlign.center,
                  style:FontStyles.s11HighlightUnW4

              ),
            ),

              ]
            ),
          ),


        ],
      ),
    );
  }
}
