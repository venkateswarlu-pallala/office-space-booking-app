import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
import 'package:homler/config/themes/gradient_style.dart';
class MissionCard extends StatelessWidget {
  final String title;
  final String img;
  final String content;
  const MissionCard({
    required this.title,
    required this.img,
    required this.content,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 700,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 4
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 10
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
                  gradient: AppColors.darkGlowGradient
            ),
          ),
          Container(
            constraints:BoxConstraints(
          ),
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: 36,maxWidth: 600
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Image.asset(img,width: 24,height: 24,),
                    Container(
                      constraints: BoxConstraints(maxWidth: 428),
                    child: GradientText(
                      style:FontStyles.s20WhiteW5 ,
                      text: title,
                      gradient: AppColors.darkGlowGradient,
                    ),),

                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 600,
                ),
                child: Text(content,style: FontStyles.s14HintW4,),
              )

            ],
          ),
          ),

        ],
      ),
    );
  }
}
