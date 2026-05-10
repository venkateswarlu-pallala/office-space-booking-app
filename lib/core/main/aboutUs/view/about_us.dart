import 'package:flutter/material.dart';


import '../../../../config/appbars/footer.dart';
import '../../../../config/appbars/main_appbar.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
import '../../home/view/features.dart';
import 'about_elements/categories_container.dart';
import 'about_elements/mission_container.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              MainAppbar(type: MainAppbarTypes.aboutUs),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.grey,
          ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 438,maxWidth: 1512
                  ),
                  color: AppColors.header,
                  padding: EdgeInsetsGeometry.symmetric(vertical: 100,horizontal: 24),
                  child: Column(
                    spacing: 10,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 44,
                          maxWidth: 159
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: AppColors.darkGlowGradient
                        ),
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 4),
                        child: Text("About Us",style: FontStyles.s24WhiteW7,),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 315,maxHeight: 54),
                        child: GradientText(
                          text: "Homler Bookings",
                          style: FontStyles.s32Linear7,
                          gradient: AppColors.darkGlowGradient,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                        maxHeight: 120,maxWidth: 530,
                      ),
                        child: Text("India's leading platform for flexible commercial space rentals. From hot desks and private cabins to fully-equipped office suites - scale your business without the burden of long-term leases.",
                        style: FontStyles.s16HintW5,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                Container(
                  constraints: BoxConstraints(
                   maxWidth: 1512
                  ),
                  child: MissionContainer(),
                ),
                SizedBox(height: 70,),

                Container(
                  constraints: BoxConstraints(
                    maxWidth: 1512,maxHeight: 772
                  ),
                    child: CategoriesContainer()),
                SizedBox(height: 70,),

                Features(),
                SizedBox(height: 70,),

            Center(
              child: Container(
                constraints:  BoxConstraints(
                  maxWidth: 700,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: AppColors.darkGlowGradient,
                ),
                padding:  EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 386,
                      child: Text(
                        "Transform Your\nBusiness Today",
                        textAlign: TextAlign.center,
                        style: FontStyles.s40White7,
                      ),
                    ),
                     SizedBox(height: 16),
                    SizedBox(
                      width: 715,
                      child: Text(
                        "Join 500+ businesses scaling smarter with Homler Bookings",
                        textAlign: TextAlign.center,
                        style: FontStyles.s20WhiteW5,
                      ),
                    ),
                     SizedBox(height: 48),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        constraints:  BoxConstraints(
                          maxWidth: 350,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Text(
                          "Book Your Space Now",
                          textAlign: TextAlign.center,
                          style: FontStyles.s20primary6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
                SizedBox(height: 70,),
                Footer()

        ]
        ),
    ),
    );
  }
}
