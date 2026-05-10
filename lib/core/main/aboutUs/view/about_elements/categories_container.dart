import 'package:flutter/material.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/font_styles.dart';
import '../../../../../config/themes/gradient_style.dart';

import 'categories_card.dart';
class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
         maxHeight: 772, maxWidth: 1512
      ),
      child: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                    maxHeight: 48
                ),
                child: GradientText(text: "Space Categories" ,
                    style: FontStyles.s32Linear4,
                    gradient: AppColors.darkGlowGradient),
              ),
               Container(
                  constraints: BoxConstraints(
                      maxHeight: 108, maxWidth: 1512
                  ),
                  child: Text(
                    "Choose from our premium workspace options tailored \nfor every business size",
                    style: FontStyles.s36Text4,
                    textAlign: TextAlign.center,
                  ),
                ),

              Container(
                constraints: BoxConstraints(
                  maxHeight: 616,
                  maxWidth: 1200,
                ),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CategoriesCard(
                        radius: 12,
                        img: "assets/images/img_chair.png",height:260 ,width:260 ,
                        content: "Individual workstations in shared open spaces with privacy dividers, ergonomic chairs, and full amenities.",
                        title: "Hot Desks",

                      ),
                    ),
                    SizedBox(width: 48),
                    Expanded(
                      child: CategoriesCard(
                        radius: 300,
                        img: "assets/images/img_table.png",height:260 ,width:260 ,
                        content: "2-8 seater lockable cabins with glass partitions, whiteboards, projectors, and dedicated power points.",
                        title: "Private Cabins",
                      ),
                    ),
                    SizedBox(width: 48),
                    Expanded(
                      child: CategoriesCard(
                        maxheight: 300,
                        maxwidth: 300,
                        radius: 600,
                        img: "assets/images/img_space.png",height:260 ,width: 260,
                        content: "Fully customizable floors with reception, meeting rooms, boardrooms, pantries, and server rooms.",
                        title: "Office Suites",
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),

    );
  }
}
