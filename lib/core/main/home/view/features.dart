import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
import 'feature_card.dart';


class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1512,
      ),
      child: Column(
        spacing: 10,
        children: [
        GradientText(
        text: "Key features",
        style: FontStyles.s32Linear4,
        gradient: AppColors.darkGlowGradient,
        ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child:Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                FeatureCard(content: "Reserve hot desks for hours or days with instant confirmation and flexible cancellation.",
                    title: "Book seats instantly", img: 'assets/icons/features/ic_person.png'),
                FeatureCard(content: "Book dedicated cabins or private offices for teams with secure access and host support.",
                    title: "Private cabins & offices",
                    img: 'assets/icons/features/ic_group.png'),
                FeatureCard(content: "Apply for monthly or multi-year leases — negotiate terms and manage renewals inside the app.",
                    title: "Long-term leases",
                    img: 'assets/icons/features/ic_agreement.png'),

              FeatureCard(content: "Owners can list commercial property, subdivide it into rentable units and enable booking + lease flows.",
                  title: "Convert commercial space",
                  img: 'assets/icons/features/ic_place.png'),
              FeatureCard(content: "PCI-compliant payments, host payouts and clear invoicing for short and long-term bookings.",
                  title: "Secure payments",
                  img: 'assets/icons/features/ic_assured.png'),
              FeatureCard(content: "Listing management, pricing controls, calendar sync and lease paperwork — everything a host needs.",
                  title: "Host tools",
                  img: 'assets/icons/features/ic_tool.png')
            ],
          ),
          ),
      ]
    ),
    );
  }
}
