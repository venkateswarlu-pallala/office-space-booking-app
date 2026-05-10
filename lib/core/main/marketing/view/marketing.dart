import 'package:flutter/material.dart';
import 'package:homler/config/appbars/footer.dart';
import 'package:homler/config/marketing_elements/details_card.dart';
import 'package:homler/config/marketing_elements/info_card.dart';
import 'package:homler/config/marketing_elements/marketing_contact.dart';
import 'package:homler/config/marketing_elements/pricing_card.dart';
import 'package:homler/config/marketing_elements/service_card.dart';
import 'package:homler/config/marketing_elements/works_card.dart';
import 'package:homler/config/themes/font_styles.dart';
import 'package:homler/config/themes/gradient_style.dart';

import '../../../../config/appbars/main_appbar.dart';
import '../../../../config/themes/app_colors.dart';
class Marketing extends StatefulWidget {
  const Marketing({super.key});

  @override
  State<Marketing> createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              MainAppbar(type: MainAppbarTypes.marketing),
          Divider(height: 1, thickness: 1, color: AppColors.grey),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 1512,
                  ),
                  color: AppColors.header,
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 100,horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                        constraints:  BoxConstraints(
                          maxWidth: 481,
                        ),

                        child: GradientText(
                          text: "Real Estate Marketing \nMade Simple & Affordable",
                          style: FontStyles.s32Linear7,
                          gradient: AppColors.darkGlowGradient,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 748,
                        child: Text("Digital & Offline Marketing Solutions for Builders & Developers in Hyderabad",
                        style: FontStyles.s16HintW5,textAlign: TextAlign.center,),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 415
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 238,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 26),
                              child: Text("Start Growing Today",style: FontStyles.s14WhiteW4,),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 164,maxHeight: 43
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 26),
                              child: GradientText(style: FontStyles.s14WhiteW4,gradient:AppColors.darkGlowGradient ,text: "View Pricing",),

                            )
                          ],
                        ),
                      ),
                      InfoCard(),

          ],
                  ),
                ),
                SizedBox(height: 70,),
                DetailsCard(),
                SizedBox(height: 70,),
                ServiceCard(),
                SizedBox(height: 70,),
                Center(
              child: Container(
                constraints:  BoxConstraints(
                  maxWidth: 810,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.border,
                  border: Border.all(
                    color: AppColors.hint,
                    width: 2,
                  ),
                ),
                padding:  EdgeInsets.all(16),
                child: Text(
                  "All plans include: Property listing, ads, events, SEO, CRM access & content marketing",
                  style: FontStyles.s18TextW4,textAlign: TextAlign.center,
                ),
              ),
            ),
                SizedBox(height: 70,),
                PricingCard(),
                SizedBox(height: 70,),
                WorksCard(),
                SizedBox(height: 70,),
                MarketingContact(),
                SizedBox(height: 70,),
                Footer()
              ]
        ),
        ),
    );
  }


  // void _onClickStart() {
  // }

  // void _onClickPricing() {
  // }
}
