import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/font_styles.dart';
import '../themes/gradient_style.dart';


class MarketingContact extends StatelessWidget {
  const MarketingContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            maxWidth: 1512
        ),
        child: Column(
            children: [
            GradientText(text: "Our Pricing Plans", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient),
        Text("Flexible plans designed to fit your business needs and budget",style: FontStyles.s36Text4, textAlign: TextAlign.center,),
        SizedBox(height: 20,),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 1512,
                ),
                padding: EdgeInsets.all(10),
                child: Container(
                  constraints:BoxConstraints(
                    maxWidth: 1000,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.10196078431372549)
                      )
                    ],
                    color: AppColors.white
                  ),
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 485,
                        ),
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,maxHeight: 48
                              ),
                              child: Text("Contact Information",style: FontStyles.s32TextW5,),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight: 36
                                    ),
                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        Image.asset("assets/icons/ic_location.png"),
                                        Text("Address",style: FontStyles.s24Text4,)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 437,
                                    ),
                                    padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                                    child: Text("5th Floor, Sreenidhi Pearls\nStreet No. 1, Patrika Nagar\nHITEC City, Hyderabad\nTelangana - 500081",
                                      style: FontStyles.s14HintW5,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,maxHeight: 78
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: 36
                                    ),
                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        Image.asset("assets/icons/ic_phone.png"),
                                        Text("Phone",style: FontStyles.s24Text4,)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 437,maxHeight: 42
                                    ),
                                    padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                                    child: Text("+91-9553293946 \n +91-9652179774",
                                      style: FontStyles.s14HintW5,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,maxHeight: 57
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: 36
                                    ),
                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        Image.asset("assets/icons/ic_mail.png"),
                                        Text("Email",style: FontStyles.s24Text4,)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 437,maxHeight: 21
                                    ),
                                    padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                                    child: Text("marketingplans@homler.in",
                                      style: FontStyles.s14HintW5,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,maxHeight: 57
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: 36
                                    ),
                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        Image.asset("assets/icons/ic_mail.png"),
                                        Text("Website",style: FontStyles.s24Text4,)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 437,maxHeight:21
                                    ),
                                    padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                                    child: Text("https://homler.in/marketing",
                                      style: FontStyles.s14HintW5,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 485,
                        ),
                        padding: EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Container(
                              constraints:BoxConstraints(
                                maxWidth: 437,
                              ),
                              child: Text("Ready to Get Started?",style: FontStyles.s32TextW5,),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 437,
                              ),
                              child: Text("Homler helps builders and developers reach the right customers while minimizing marketing costs. Focus on construction & sales, and let us handle your marketing, branding & lead generation.",
                                style: FontStyles.s14HintW5,
                              ),
                            ),
                            SizedBox(height: 24,),
                           Container(
                             constraints: BoxConstraints(
                               maxWidth: 437,maxHeight: 48
                             ),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: AppColors.primary
                             ),
                             padding: EdgeInsets.symmetric(vertical: 8,horizontal: 26),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Image.asset("assets/icons/ic_phone_white.png"),
                                 SizedBox(width: 10,),
                                  Text("Call Us Now",style: FontStyles.s20WhiteW5,),

                               ],
                             ),
                           ),
                            SizedBox(height: 20,),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 46,maxWidth: 437
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                                color: AppColors.border,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              padding: EdgeInsetsGeometry.symmetric(vertical: 8,horizontal: 26),
                              child: Center(child: Image.asset("assets/icons/ic_mail.png")),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              )
      ],
    ),
    );
  }
}
