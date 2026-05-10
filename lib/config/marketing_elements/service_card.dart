import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/font_styles.dart';
import '../themes/gradient_style.dart';
class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1512,
      ),
      child: Column(
          children: [
          Center(child: GradientText(text: "Our Services", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient)),
          Text("Complete marketing ecosystem for your real estate business",style: FontStyles.s36Text4, textAlign: TextAlign.center,),
      SizedBox(height: 20,),
            Container(
              constraints: BoxConstraints(
                maxWidth: 1512
              ),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 24),
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _card(img: "assets/icons/marketing/ic_property.png", title: "Property Listing on Homler Platform"),
                  _card(img: "assets/icons/marketing/ic_meta.png", title: "Meta (Facebook & Instagram) Ads"),
                  _card(img: "assets/icons/marketing/ic_search.png", title: "Google Search & Map Ads"),
                  _card(img: "assets/icons/marketing/ic_share.png", title: "Social Media Promotions"),
                  _card(img: "assets/icons/marketing/ic_seo.png", title: "SEO Development" ,),
                  _card(img: "assets/icons/marketing/ic_video.png", title: "Video & Drone Shooting"),
                  _card(img: "assets/icons/marketing/ic_promotions.png", title: "Physical Branding (Autos,Cabs,Buses)"),
                  _card(img: "assets/icons/marketing/ic_networking.png", title: "Monthly Podcasts & Project Interviews"),
                  _card(img: "assets/icons/marketing/ic_events.png", title: "Event & Festival Promotions"),
                  _card(img: "assets/icons/marketing/ic_mobile.png", title: "Mobile CRM Access",)
                ],
              ),
            )
      ]
      ),
    );
  }
  Widget _card({
    required String img,
    required String title,
     double width = 240,
  })
  {
    return Container(
      constraints: BoxConstraints(
          maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 2
          ),
        ],
      ),
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            height: 48,width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(255, 106, 0, 0.10196078431372549),

            ),
            child: Image.asset(img),
          ),
          Text(title,style: FontStyles.s14TextW4,textAlign: TextAlign.center,),


        ],
      ),
    );
  }
}
