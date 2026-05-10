import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
import 'package:homler/config/themes/gradient_style.dart';


class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1512,
      ),
      child: Column(
        children: [
          Center(child: GradientText(text: "Why Choose Homler?", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient)),
          Text("Transform your property marketing with our \ncomprehensive, cost-effective solutions",style: FontStyles.s36Text4, textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Container(
            constraints: BoxConstraints(
              maxWidth: 1512,
            ),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.center,
              spacing: 30,
              children: [
                _card(img: "assets/icons/marketing/ic_pricing.png", title: "Cost Savings", context: "Cut down ₹1,00,000+ monthly expenses to just ₹25,000"),
                _card(img: "assets/icons/marketing/ic_solution.png", title: "One-Stop Solution", context: "No need to hire multiple staff for marketing"),
                _card(img: "assets/icons/marketing/ic_instant.png", title: "Instant Lead Delivery", context: "Verified leads directly to WhatsApp, Email & Excel"),
                _card(img: "assets/icons/marketing/ic_network.png", title: "Hybrid Marketing", context: "Digital + Physical + Event Promotions combined"),
                _card(img: "assets/icons/marketing/ic_base.png", title: "Hyderabad-Based Team", context: "Local expertise with strong real estate network"),
                _card(img: "assets/icons/marketing/ic_visibility.png", title: "Complete Brand Visibility", context: "Comprehensive marketing across all channels")
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _card({
    required String img,
    required String title,
    required String context,
})
{
  return Container(
    constraints: BoxConstraints(
      maxWidth: 456,
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
    padding: EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Container(
          height: 48,width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(151, 28, 0, 0.10196078431372549),

          ),
          child: Image.asset(img),
        ),
        Text(title,style: FontStyles.s20TextW4,),
        Container(
          constraints: BoxConstraints(
            maxWidth: 408,
          ),
          child: Text(context,style: FontStyles.s16HintW5,),
        )
      ],
    ),
  );
}
}
