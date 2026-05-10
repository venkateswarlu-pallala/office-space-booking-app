import 'package:flutter/material.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';



class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1420,maxHeight: 1024,

      ),
      padding: EdgeInsets.fromLTRB(72, 119, 0, 71),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 601,maxHeight: 440),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Expanded(
                  child: Text("List Your Commercial Space on Homler — Start Earning from Day One",
                    style: FontStyles.s34Text7,),
                ),
                  Expanded(
                    child: Text("Homler Bookings lets you convert any commercial property into a rentable co-working unit. List cabins, desks, floors, or full buildings, set your pricing and lease rules, and start receiving bookings or long-term lease requests instantly. Manage everything from availability to payments inside one dashboard.",
                      style: FontStyles.s18TextW4,),
                  ),
                      Expanded(
                        child: AnimButton(onTap: (){},
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 176,
                              maxHeight: 56,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primaryButtonBg,
                            ),
                            child: Center(child: Text('Get Started',style: FontStyles.s22WhiteW5,)),
                          ),
                        ),
                      )
                    ]

              )
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 578,maxHeight: 157,
                ),
                child: Row(
                  spacing: 32,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 157,maxWidth: 273),
                      padding: EdgeInsets.fromLTRB(12, 24, 28, 20),
                      decoration: BoxDecoration(
                        color: AppColors.primaryButtonBg,
                        borderRadius: BorderRadius.circular(24)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("21K+",style: FontStyles.s24WhiteW7,),
                        Text("High-intent users searching for seats,cabins & commercial spaces.",style: FontStyles.s14WhiteW4,)
                        ],
                      ),

                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 157,maxWidth: 273),
                      padding: EdgeInsets.fromLTRB(12, 24, 28, 20),
                      decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("362",style: FontStyles.s24Text7,),
                          Text("Trusted hosts already earning from bookings & leases.",style: FontStyles.s14TextW4,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Container(
                constraints: BoxConstraints(maxWidth: 581,maxHeight: 154),
                padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: AppColors.border),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 30,maxWidth: 285
                          ),
                          child: Text("Unified Space Management",style: FontStyles.s16Text7),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 84,maxWidth: 307,
                          ),
                          child: Text("Manage bookings, blackout dates, lease agreements, renewals, and performance analytics — everything you need to run your commercial space smoothly.",
                          style: FontStyles.s12TextW4,),
                        )
                      ],
                    ),
                    Image.asset('assets/images/img_prop.png',width: 188,height: 113,)
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 70,),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1124,maxHeight: 833
              ),

              child: Stack(
                children: [
                  Positioned(
                    top: 83,

                    child: Image.asset('assets/images/img_info.png',
                    ),
                  ),
                  Positioned(
                   left: 280 ,
                    bottom: 668,
                    child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 165,maxHeight: 165
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryButtonBg,
                          borderRadius: BorderRadius.circular(165),
                        ),
                        height: 165,
                        width: 165,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/logos/logo_homler_mini.png'),
                            Text("Bookings",style: FontStyles.s16WhiteW5,)
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
