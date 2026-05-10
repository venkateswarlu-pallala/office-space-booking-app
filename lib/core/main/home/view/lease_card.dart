import 'package:flutter/material.dart';
import 'package:homler/config/themes/font_styles.dart';

import '../../../../config/elements/image_loader.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/elements/rating.dart';
class LeaseCard extends StatelessWidget {
 final double height;
 final double width;
    const LeaseCard({
     this.height =350,
     this.width =400,
    super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints:  BoxConstraints(
        minHeight: height,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3/1,
            child: ImageLoader(url: "assets/images/image_card.png"),
          ),

          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Rating(
                  rating: 5.0,
                  reviews: 120,
                  starSize: 16,
                ),

                 SizedBox(height: 8),

                Text("Malon Greens", style: FontStyles.s14TextW7),

                 SizedBox(height: 8),

                Row(
                  children: [
                     Icon(Icons.location_off_outlined,
                        size: 18, color: Colors.grey),
                     SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Mumbai, Maharashtra",
                        style: FontStyles.s11GreyW5,
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 10),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/ic_seat.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 6),
                          Text("Lease (2 Floors)", style: FontStyles.s12TextW4),
                        ],
                      ),
                      Row(
                        children: [
                          Text("₹1Cr", style: FontStyles.s14TextW4),
                          Text("/year", style: FontStyles.s12TextW4),

                        ],
                      )
                    ],
                  ),
                ),

                 SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 24,
                          maxWidth: 69),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/icons/ic_wifi.png', width: 24, height: 24),
                           SizedBox(width: 4),
                          Text(
                            "WiFi",
                            style: FontStyles.s11HighlightW5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Wrap(
                      children: [
                        Image.asset('assets/icons/ic_ac.png', width: 24, height: 24),
                         SizedBox(width: 4),
                        Text(
                          "AC",
                          style: FontStyles.s11HighlightW5,
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Wrap(
                      children: [
                        Image.asset('assets/icons/ic_cc.png', width: 24, height: 24),
                         SizedBox(width: 4),
                        Text(
                          "CCTV",
                          style: FontStyles.s11HighlightW5,
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Container(
                      constraints: BoxConstraints(maxHeight: 24,
                          maxWidth: 69),
                      child:
                      Image.asset('assets/icons/ic_power.png', width: 24, height: 24),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),


    );
  }
}
