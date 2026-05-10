import 'package:flutter/material.dart';
import 'package:homler/config/appbars/footer.dart';
import 'package:homler/config/themes/font_styles.dart';
import 'package:homler/core/main/commercialDetails/view/amenities_section.dart';
import 'package:homler/core/main/commercialDetails/view/booking_section.dart';
import 'package:homler/core/main/commercialDetails/view/reviews_section.dart';
import 'package:homler/core/main/commercialDetails/view/similar_section.dart';

import '../../../../config/appbars/main_appbar.dart';
import '../../../../config/elements/rating.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/gradient_style.dart';
class CommercialDetails extends StatefulWidget {
  const CommercialDetails({super.key});

  @override
  State<CommercialDetails> createState() => _CommercialDetailsState();
}

class _CommercialDetailsState extends State<CommercialDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
              children: [
              MainAppbar(),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.grey,
          ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 1512,
                  ),
                  padding: EdgeInsets.all(24),
                  child: AspectRatio(
                    aspectRatio: 3/ 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Wrap(
                        runSpacing: 24,
                        spacing: 24,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxHeight: 472,maxWidth: 968),
                              child:
                              Image.asset("assets/images/img_c3.png")
                        ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 472,maxHeight: 472
                            ),
                              child: AspectRatio(
                                aspectRatio: 2/1,
                                child: Wrap(
                                  runSpacing: 24,
                                  spacing: 24,
                                  children: [
                                    Image.asset("assets/images/img_c2.png",fit: BoxFit.cover,),
                                    Image.asset("assets/images/img_c1.png",fit: BoxFit.cover,)
                                  ],
                                ),
                              ),
                            ),
                        ],

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text("Malon Greens",style: FontStyles.s40Text7,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a",
                      style: FontStyles.s16HintW5,),
                      Row(
                        children: [
                          Icon(Icons.location_on,
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
                      Rating(
                        rating: 5.0,
                        reviews: 120,
                        starSize: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                BookingSection(),
                SizedBox(height: 70,),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 1460,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.darkGlowGradient,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 928,
                        ),
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Rent/Lease— monthly & yearly",style:FontStyles.s24WhiteW7,),
                             Text("To get more details and pricing for commercial spaces in your desired area, please connect with us.",style: FontStyles.s14WhiteW4,)
                           ],
                        ),
                      ),
                      Spacer(),
                       Container(
                         constraints: BoxConstraints(
                           maxWidth: 400,
                         ),
                         child: Wrap(
                           alignment: WrapAlignment.center,
                           spacing: 10,
                       runSpacing: 10,
                       children: [
                      SizedBox(
                        width: 150,
                        child: _inputBox("Years"),
                      ),
                      SizedBox(
                        width: 150,
                        child: _inputBox("Months"),
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding:  EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Get Now",style:FontStyles.s12whiteW4,),
                        ),
                      ),
                         ]
                         ),
                       ),
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                AmenitiesSection(),
                SizedBox(height: 70,),
                SimilarSection(),
                SizedBox(height: 30,),
                ReviewsSection(),
                SizedBox(height: 30,),
                Center(
                  child: GradientText(
                    text: "Location",
                    style: FontStyles.s32Linear4,
                    gradient: AppColors.darkGlowGradient,
                    textAlign: TextAlign.center,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 3/1,
                    child: Image.asset("assets/images/maps.png",)),
                SizedBox(height: 30,),
                Footer()
              ]
        ),
        )
    );
  }
}Widget _inputBox(String hint) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
