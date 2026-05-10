import 'package:flutter/material.dart';
import 'package:homler/config/appbars/footer.dart';
import 'package:homler/config/appbars/main_appbar.dart';
import 'package:homler/core/main/support/view/complaint_card.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
              // maxHeight: 348, maxWidth: 1512
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
                    horizontal: 15, vertical: 2),
                child: Text("support", style: FontStyles.s24WhiteW7,),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 650, ),
                child: GradientText(
                  text: "Raise an issue or find answers fast",
                  style: FontStyles.s32Linear7,
                  gradient: AppColors.darkGlowGradient,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                   maxWidth: 660,
                ),
                child: Text(
                  "For problems with seat, cabin, or office bookings, raise a ticket or browse quick FAQs before contacting the team.",
                  style: FontStyles.s16HintW5,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 740,
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  children:  [
                    _StatusPill(
                      text: "24–48 hr response for most tickets",
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      textStyle: FontStyles.s14WhiteW4 ,
                    ),
                    SizedBox(width: 10),
                    _StatusPill(
                      text: "Live status & booking reference",
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      textStyle: FontStyles.s14TextW4,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
              RaiseIssueSection(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 40),
                child: Wrap(
                  spacing: 48,
                  runSpacing: 48,
                  children: [
                    _leftContent(),
                    _rightContent()
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Footer()
        ]
        ),
      ),
    );
  }
}
class _StatusPill extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle textStyle;


  const _StatusPill({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 354
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            margin:  EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              gradient: AppColors.darkGlowGradient,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
Widget _leftContent() {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 684
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// FAQ LABEL
        Text(
          "FAQ",
          style: FontStyles.s16Text5.copyWith(
            color: AppColors.primary,
          ),
        ),

         SizedBox(height: 10),

        /// TITLE
        Text(
          "Do you have any questions for us?",
          style: FontStyles.s48Text6,
        ),

         SizedBox(height: 10),

        /// DESCRIPTION
        Text(
          "If there are questions you want to ask. We will answer all your question.",
          style: FontStyles.s14HintW5,
        ),

         SizedBox(height: 20),

        /// INPUT + BUTTON
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Whats your question ?",
                  hintStyle: FontStyles.s12HintW5,
                  contentPadding:  EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
             SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding:  EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              onPressed: () {},
              child:  Text("Ask Now",style: FontStyles.s16WhiteW5,),
            )
          ],
        )
      ],
    ),
  );
}
Widget _rightContent() {
  final faqs = [
    {
      "q": "How can I book a seat in homler",
      "a":
      "Go to search page and find the suitable seat, then go to details page and click Book Now in your selected date and seat"
    },
    {"q": "How can I book a seat in homler", "a": "Answer"},
    {"q": "How can I book a seat in homler", "a": "Answer"},
    {"q": "How can I book a seat in homler", "a": "Answer"},
  ];

  return Container(
    constraints: BoxConstraints(
      maxWidth: 684
    ),
    child: Column(
      children: faqs.map((faq) {
        return _faqItem(faq["q"]!, faq["a"]!);
      }).toList(),
    ),
  );
}
Widget _faqItem(String question, String answer) {
  return ExpansionTile(
    tilePadding: const EdgeInsets.symmetric(vertical: 10),
    title: Text(
      question,
      style: FontStyles.s16Text5,
    ),
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          answer,
          style: FontStyles.s12HintW5,
        ),
      )
    ],
  );
}
