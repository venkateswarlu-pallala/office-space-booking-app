import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';

import '../../../../config/themes/font_styles.dart';
import '../../../../config/themes/gradient_style.dart';
class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Column(
        children: [

          Center(
            child: GradientText(
              text: "Reviews",
              style: FontStyles.s32Linear4,
              gradient: AppColors.darkGlowGradient,
              textAlign: TextAlign.center,
            ),
          ),


           SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 250
              ),
              padding: EdgeInsets.all(24),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _reviewCard(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _reviewCard() {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 410,
    ),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color:Color.fromRGBO(0, 0, 0, 0.25098039215686274),
          blurRadius: 10,
          offset:  Offset(0, 4),
        ),
      ],
    ),
    child: Container(
      constraints: BoxConstraints(
        maxWidth: 356,
        maxHeight: 56
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/icons/features/ic_persons.png"),
              ),

               SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Mirana Marci",
                    style: FontStyles.s16Text5,
                  ),

                  const SizedBox(height: 4),

                  const Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Icon(Icons.star, size: 16, color: Colors.orange),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 1, thickness: 1, color: AppColors.grey),
          Container(
            constraints: BoxConstraints(maxWidth: 356,maxHeight: 102),
            child: Text(
              "I was blown away by how complete this UI kit is. "
                  "It has everything I need, from assets to components.",
              style: FontStyles.s14TextW4,
            ),
          ),
        ],
      ),
    ),
  );
}