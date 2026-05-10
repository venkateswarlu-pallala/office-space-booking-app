import 'package:flutter/material.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/font_styles.dart';
import '../../../../../config/themes/gradient_style.dart';

import 'mission_card.dart';

class MissionContainer extends StatelessWidget {
  const MissionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints(
         maxWidth: 1512
      ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: 48
            ),
            child: GradientText(text: "Our Mission", style: FontStyles.s32Linear4, gradient: AppColors.darkGlowGradient),
          ),
          Container(
              constraints: BoxConstraints(
                  maxWidth: 1512
              ),
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text("Empowering entrepreneurs, startups, and enterprises with "
                  "flexible, premium workspaces across India's prime business districts.",
                style: FontStyles.s28TextW5,
                textAlign: TextAlign.center,
              ),
            ),

          Center(
      child: Container(
        constraints:  BoxConstraints(
          maxWidth:1150,
        ),
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Expanded(
                child: MissionCard(
                  title: "Modern Infrastructure",
                  img: "assets/logos/logo_space.png",
                  content:
                  "State-of-the-art facilities across 50+ prime locations. High-speed fiber internet (1Gbps+), 100% power backup, security systems, and amenities for productivity.",
                ),
              ),
              SizedBox(width: 48),
              Expanded(
                child: MissionCard(
                  title: "Operational Excellence",
                  img: "assets/logos/logo_light.png",
                  content:
                  "99.9% uptime guarantee with 24/7 access. Enterprise-grade HVAC systems, professional housekeeping, and dedicated support teams ensure seamless operations.",
                ),
              ),
            ],
          ),
        ),
    ),
    ]
    ),

    );
  }
}
