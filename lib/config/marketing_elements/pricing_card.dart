import 'package:flutter/material.dart';
import 'package:homler/config/themes/font_styles.dart';

import '../themes/app_colors.dart';
import '../themes/gradient_style.dart';
class PricingCard extends StatelessWidget {
  const PricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1512,
      ),
      child: Column(
        children: [
          GradientText(text: "Our Pricing Plans", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient),
          Text("Flexible plans designed to fit your business needs and budget",style: FontStyles.s36Text4, textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Container(
            constraints:BoxConstraints(
              maxWidth: 1200,
            ),
            padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 30,
                children: [
                 _card(textStyle: FontStyles.s16Text5,
                     title:"Alpha Plan", price: "₹25,000",
                     items: ["Meta Ads (FB, Insta)",
                       "2 Social Posts",
                       "Video Editing",
                       "Property Listing",
                       "Dedicated Account Manager"

                 ]
                 ),

                  Container(
                      constraints: BoxConstraints(
                        maxWidth: 370
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding:  EdgeInsets.fromLTRB(5, 9, 5, 9),
                            child: _card(
                              isSelected: false,
                              buttonRadius: 12,
                              buttonColor:AppColors.primaryButtonBg ,
                              textStyle: FontStyles.s16WhiteW5,
                              color: AppColors.highlight,

                              title: "Gamma Plan",
                              price: "₹75,000",
                              items:  [
                                "Meta Ads (FB, Insta)",
                                "Interview Video",
                                "4 Social Posts",
                                "Poster Ads",
                                "Dedicated Account Manager",
                                "Priority Support",
                              ],
                            ),
                          ),

                          ClipRRect(
                            child: Positioned(
                              top: -5,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  padding:  EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: AppColors.darkGlowGradient,
                                  ),
                                  child: Text(
                                    "Most Popular",
                                    style: FontStyles.s14WhiteW4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                  _card(textStyle:FontStyles.s16Text5,

                        title:"Gamma Plan", price: "₹75,000",
                        items: ["Meta + Google + Maps + Video Ads",
                          "Drone Shoot",
                          "6 Social Posts",
                          "Main Poster Ads",
                          "Dedicated Account Manager",
                          "24/7 Priority Support"

                        ]
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _card({
    required String title,
    required String price,
      buttonRadius=8,
     Color color = AppColors.white,
     Color buttonColor = AppColors.white,
      required TextStyle textStyle,
    double width = 360,
    required List<String> items,
      bool isSelected = true
  })
{
  return Container(
    constraints: BoxConstraints(
      maxWidth: width
    ),
    margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.all(24),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: color,
            width: 1
      ),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 2
        ),
      ],),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 312,maxHeight: 36
          ),
          child: Text(title,style: FontStyles.s24Text7,),
        ),
        SizedBox(height: 8,),
        Container(
          constraints: BoxConstraints(
              maxWidth: 312,maxHeight: 24
          ),
          child: RichText(
            text: TextSpan(
            children:[ TextSpan(
            text: price,style: FontStyles.s16Text5),
              TextSpan(
                text: '+ GST/month',style: FontStyles.s12HintW5
              )
  ]
          ),

          ),
        ),
        SizedBox(height: 20,),
        Container(
          constraints: BoxConstraints(
              maxWidth: 312,
          ),
          child: Column(
            spacing: 8,
            children: [
              ...items
                  .map((item)=>Container(
                constraints: BoxConstraints(
                    maxWidth: 312,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Image.asset("assets/icons/marketing/ic_mark.png",width: 24,height: 24,),
                    Expanded(
                      child: Text(
                        item,style: FontStyles.s14TextW4,),
                    )
                  ],
                ),
              ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: isSelected
                    ? BoxDecoration(
                  border: Border.all(
                    color: AppColors.text,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                )
                    : null,

                width: 312,
                height: 38,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 100,maxHeight: 24
                  ),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(buttonRadius)
                    ),
                    alignment: Alignment.center,
                    child: Text("Choose Plan",style: textStyle,)),
              )
            ],
          ),
        )
      ],
    ),
  );
}
}
