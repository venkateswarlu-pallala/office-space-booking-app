import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/font_styles.dart';
import '../themes/gradient_style.dart';
class WorksCard extends StatelessWidget {
  const WorksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:BoxConstraints(
        maxWidth: 1512,
      ),
      child: Column(
        children: [
          GradientText(text: "How It Works", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient),
          Text("Simple 4-step process to transform your property marketing",style: FontStyles.s36Text4, textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 900,
              ),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
              child: Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _card(number: "1", header: "Partner with Homler", context: "Select your suitable plan and get started"),
                  _card(number: "2", header: "We Create & Promote", context: "Homler team handles content, ads, and listings "),
                  _card(number: "3", header: "You Get Leads", context: "Receive direct buyer & investor leads instantly"),
                  _card(number: "4", header: "Grow Your Business", context: "Focus on sales while Doland manages marketing")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _card({
    required String number,
    required String header,
    required String context,

})
{
  return Container(
    constraints: BoxConstraints(
      maxWidth:420 ,
    ),
    padding: EdgeInsets.symmetric(vertical: 10,),
    child: Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 48,maxWidth: 48,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.primaryButtonBg
          ),
          child: Center(
              child: Text(number,style: FontStyles.s32White5,)),
        ),
        SizedBox(width: 5,),
        Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: 400,
                ),
                child: Text(header,style: FontStyles.s20TextW5,),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 400,
                ),
                child: Text(context,style: FontStyles.s10HintW5,),

              )
            ],
          ),
        )
      ],
    ),
  );
}
}
