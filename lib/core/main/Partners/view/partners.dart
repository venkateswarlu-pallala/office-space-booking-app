import 'package:flutter/material.dart';
import 'package:homler/config/elements/button.dart';
import '../../../../config/appbars/footer.dart';
import '../../../../config/appbars/main_appbar.dart';
import '../../home/view/lease_card.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
class Partners extends StatefulWidget {
  const Partners({super.key});

  @override
  State<Partners> createState() => _PartnersState();

}

class _PartnersState extends State<Partners> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTab = screenWidth < 1024;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainAppbar(type: MainAppbarTypes.partners),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: 348, maxWidth: 1512
                  ),
                  color: AppColors.header,
                  padding: EdgeInsetsGeometry.symmetric(
                      vertical: 100, horizontal: 24),
                  child: Column(
                    spacing: 10,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: 44,
                            maxWidth: 154
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: AppColors.darkGlowGradient
                        ),
                        padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20, vertical: 4),
                        child: Text("Partners", style: FontStyles.s24WhiteW7,),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: 656, maxHeight: 54),
                        child: GradientText(
                          text: "Homler Partners — Publish Property",
                          style: FontStyles.s32Linear7,
                          gradient: AppColors.darkGlowGradient,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 30, maxWidth: 460,
                        ),
                        child: Text(
                          "List your property for seats, cabins or full lease",
                          style: FontStyles.s20HintW4,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 1512,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                      runSpacing: 16,
                      spacing: 16,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: 946,
                          ),
                          child:Column(
                            spacing: 16,
                            children: [
                              _card( header: "Basic Details",
                                  children: [
                                    Wrap(
                                      spacing: 16,
                                      runSpacing: 16,

                                      children: [
                                        _field(width: 898,height: 81,labelHeight: 56,labelWidth: 441,
                                            text: "Title",
                                            hint: "Please enter title"),
                                        _field(width: 898,height: 81,labelHeight: 56,labelWidth: 441,
                                            text: "Category",
                                            hint: "search here"),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    if(!isTab)_field(
                                        text: "Description",
                                        hint: "Describe your workspace...",
                                        width: 898,
                                        height: 175,
                                        labelHeight: 150,
                                        labelWidth: 898
                                    ),if(isTab)_field(
                                        text: "Description",
                                        hint: "Describe your workspace...",
                                        width: 898,
                                        height: 175,
                                        labelHeight: 150,
                                        labelWidth: 441
                                    )

                                  ]
                              ),
                              _card( header: "Location",
                                children: [
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,

                                    children: [
                                      _field(width: 898,
                                          text: "Address",
                                          hint: "Please enter title"),
                                      _field(width: 898,
                                          text: "City",
                                          hint: "Please enter title"),
                                    ],
                                  ),
                                  SizedBox(height: 16,),

                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,

                                    children: [
                                      _field(width: 898,
                                          text: "State",
                                          hint: "Please enter title"),
                                      _field(width: 898,
                                          text: "Country",
                                          hint: "Please enter title"),
                                    ],
                                  ),

                                ],
                              ),
                              _card( header: "Seats & Cabins",
                                  children: [
                                    Wrap(
                                      spacing: 16,
                                      runSpacing: 16,

                                      children: [
                                        _field(width: 898,
                                            text: "Seats (only employee)",
                                            hint: "25",
                                            labelWidth: 288
                                        ),
                                        _field(width: 898,
                                            text: "Cabin",
                                            hint: "4",
                                            labelWidth: 288),
                                        _field(width: 898,
                                            text: "Total Capacity",
                                            hint: "45",
                                            labelWidth: 288),
                                      ],
                                    ),

                                  ]
                              ),
                              _card(header: "Pricing",
                                children: [
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,

                                    children: [
                                      _field(width: 898,
                                        text: "Bookings/month",
                                        hint: "1,00,000",),
                                      _field(width: 898,
                                        text: "Lease/year",
                                        hint: "10,00,000",),
                                    ],
                                  ),

                                ],
                              ),
                              _card( header: "Contact Details",
                                children: [
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      _field(width: 898,
                                          text: "First Name",
                                          hint: "Enter your name"),
                                      _field(width: 898,
                                          text: "Last Name (optional)",
                                          hint: "Enter your last name"),
                                    ],
                                  ),
                                  SizedBox(height: 16,),
                                 Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      _field(width: 898,
                                          text: "Mail",
                                          hint: "Enter your mail here"),
                                      _field(width: 898,
                                          text: "Phone",
                                          hint: "Enter your phone number"),
                                    ],
                                  ),

                                ],
                              ), _card( header: "Photos",
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      spacing: 16,
                                      children: [
                                        _image(
                                            img: "assets/images/ic_imagePicker.png"),
                                        _image(
                                            img: "assets/images/img_ImagePicker(1).png"),
                                        _image(
                                            img: "assets/images/img_ImagePicker(2).png"),
                                        _image(
                                            img: "assets/images/img_ImagePicker(3).png"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        if(!isTab)
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: 502, maxHeight: 582
                          ),
                          child: Column(
                            children: [
                              Container(constraints: BoxConstraints(
                                  maxWidth: 502,
                              ),
                                  child: LeaseCard(
                                  )),
                              SizedBox(height: 32,),
                              Button(onTap: () {},
                                text: "Publish Property",
                                style: FontStyles.s20WhiteW5,

                              )
                            ],
                          ),
                        )
                      ]
                  ),
                ),
                Footer()

              ],
            )
        )
    );
  }

  Widget _card({
    required String header,
    required List<Widget> children,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 946,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            blurRadius: 40,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 898,
              maxHeight: 48,
            ),
            child: GradientText(
              text: header,
              style: FontStyles.s32Linear4,
              gradient: AppColors.darkGlowGradient,
            ),
          ),

          SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _field({
    double width = 898,
    double height = 81,
    double labelWidth = 441,
    double labelHeight = 56,
    required String text,
    required String hint,

  }) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: width, maxHeight: height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: FontStyles.s14HintW5,),
          SizedBox(height: 4,),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: labelWidth, maxHeight: labelHeight
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
                    hintStyle: FontStyles.s16HintW5,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(24, 15, 0, 17)

                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image({
    required String img,
  }) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 220, maxWidth: 250
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: AppColors.border
      ),
      child: Image.asset(img, fit: BoxFit.cover,),
    );
  }
}