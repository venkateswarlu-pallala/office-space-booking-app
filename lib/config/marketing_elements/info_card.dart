import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/font_styles.dart';
class InfoCard extends StatelessWidget {

  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:  BoxConstraints(
          maxWidth: 1464,
        ),
        padding:  EdgeInsets.all(10),
        alignment: Alignment.center, // ✅ centers row
        child:Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 48,
          runSpacing: 20,
          children: [
            _infoCard(
              title: "75%",
              subtitle: "Cost Reduction",
              background: AppColors.white,
              titleStyle: FontStyles.s22highlightW5,
              subtitleStyle: FontStyles.s14HighlightW4,
            ),
            _infoCard(
              title: "₹25K",
              subtitle: "Starting Price",
              background: AppColors.white,
              titleStyle: FontStyles.s22highlightW5,
              subtitleStyle: FontStyles.s14HighlightW4,
            ),
            _infoCard(
              title: "10+",
              subtitle: "Marketing Services",
              background: AppColors.highlight,
              titleStyle: FontStyles.s22WhiteW5,
              subtitleStyle: FontStyles.s10WhiteW5,
            ),
          ],
        ),

        );
  }
  Widget _infoCard({
    required String title,
    required String subtitle,
    required Color background,
    required TextStyle titleStyle,
    required TextStyle subtitleStyle,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center, // ✅ vertical center
        crossAxisAlignment: CrossAxisAlignment.center, // ✅ horizontal center
        children: [
          Text(title, style: titleStyle),
          Text(
            subtitle,
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }
}
