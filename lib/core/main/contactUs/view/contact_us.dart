import 'package:flutter/material.dart';
import 'package:homler/config/appbars/footer.dart';
import 'package:homler/config/elements/button.dart';

import '../../../../config/appbars/main_appbar.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainAppbar(),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: 1512,
              ),
              color: AppColors.header,
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 48),
              child: Wrap(
                spacing: 24,
                runSpacing: 20,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 892,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contact Us",style: FontStyles.s40Text7,),
                        Text("Email, call, or complete the form to learn how homler can solve your \ncommercial problems",
                          style: FontStyles.s16HintW5,),
                        SizedBox(height: 20,),
                        Container(
                          constraints: BoxConstraints(
                              maxHeight: 36
                          ),
                          child: Text("bookings@homler.in",
                            style: FontStyles.s18TextW7,),
                        ),
                        SizedBox(height: 10,),

                           Text("+91 9652179774",
                            style: FontStyles.s18TextW7,),

                        SizedBox(height: 70,),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 872,
                          ),
                          child:Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 24,
                            runSpacing: 20,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 274,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Customer Support",style: FontStyles.s20TextW5,),
                                    Text("Our Support team is available around the clock to address any concerns or queries you may have.",
                                      style: FontStyles.s12HintW5,)
                                  ],
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 274,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Feedback & Suggestions",style: FontStyles.s20TextW5,),
                                    Text("We value your feedback and are continuously working to improve Homler. Your input is crucial in shaping the feature of Homler.",
                                      style: FontStyles.s12HintW5,)
                                  ],
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 274,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Marketing Support",style: FontStyles.s20TextW5,),
                                    Text("For media-related questions or press inquiries, Pleas contact us at media@homler.in",
                                      style: FontStyles.s12HintW5,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get in Touch",style: FontStyles.s28TextW5,),
                        Text("You can reach us anytime",style: FontStyles.s12HintW5,),
                       SizedBox(height: 20,),
                       Wrap(
                         runSpacing: 16,
                         spacing: 16,
                         children: [
                           _field( hint: "First Name",width: 218),
                           _field( hint: "Last Name",width: 218),
                         ],
                       ),
                        SizedBox(height: 12,),
                        _field( hint: "Mail"),
                        SizedBox(height: 12,),
                        _field( hint: "Phone"),
                        SizedBox(height: 12,),
                        _field( hint: "Please enter here",height: 120),
                        SizedBox(height: 12,),
                        Center(
                          child: Button(
                            text: "Submit",
                            onTap: (){},
                            width: 300,
                            style: FontStyles.s18White5,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text("By contacting us, you agree to our",style: FontStyles.s14TextW4,textAlign: TextAlign.center,),
                              RichText(
                                textAlign: TextAlign.center,
                                  text: TextSpan(
                                      children:[
                                        TextSpan(
                                            text: 'Terms of service ',style: FontStyles.s14TextW7
                                        ),TextSpan(
                                            text: ' and ',style: FontStyles.s14TextW4
                                        ),TextSpan(
                                            text: ' Privacy Policy',style: FontStyles.s14TextW7
                                        )
                                      ]
                                  ),

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
              maxWidth: 1512
            ),
              padding: EdgeInsets.symmetric(vertical: 100,horizontal: 48),
              child: Wrap(
                spacing: 10,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 500,minWidth: 600
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.asset("assets/images/img_map.png",fit: BoxFit.cover,),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 806,

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Our Location",style: FontStyles.s24Text5,),
                        SizedBox(height: 10,),
                        Text("Connection Near and Far",style: FontStyles.s40Text7,),
                        SizedBox(height: 15,),
                        Text("Headquarters",style: FontStyles.s32TextW5,),
                        SizedBox(height: 10,),
                        Text("Thuurpu cheruvu center, Veeravasaram\nBhimavaram, West Godavari Dist.\nAndhra  Pradesh. 534245\nIndia",
                            style: FontStyles.s16HintW5),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
  Widget _field({
    double width = 452,
    double height = 48,
    required String hint,

  }) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: width, minHeight: height
      ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: FontStyles.s14HintW5,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(24, 15, 0, 17)

              ),
            ),
    );
  }
}
