import 'package:flutter/material.dart';
import 'package:homler/config/elements/anim_button.dart';
import 'package:homler/config/routes/routers.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimButton(onTap: _onClickBooking,
        child: Container(
          constraints: BoxConstraints(maxWidth: 470,maxHeight: 227),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10196078431372549),
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(0, 8)
              )
            ],
            color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 44),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 330,maxHeight: 24
                      ),
                      child: Text("Malon Greens",style: FontStyles.s16Text7,),
                    ),

                    SizedBox(height: 21,width: 84,child: Text("20/03/2025"),
                    )
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 470,maxHeight: 2
                ),
                color:  Color.fromRGBO(240, 240, 240, 1.0),
              ),
              SizedBox(height: 6,),
              _bar(title: "Order No:", value: " 238562312",visible: false, title2: '', value2: '') ,
              SizedBox(height: 6,),
              _bar(title: "From:", value: " 2 Aug 2025", title2: 'To:', value2: '2 oct 2025'),
              SizedBox(height: 6,),
              _bar(title: "Booked:", value: "  2M", title2: 'Shift: ', value2: '10AM - 6PM'),
              SizedBox(height: 6,),
              Container(
                constraints: BoxConstraints(maxWidth: 470,maxHeight: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 213,maxHeight: 24),
                        child: Row(
                          children: [
                            SizedBox(height: 24,width: 24,
                                child: Image.asset("assets/icons/ic_cabin.png",height: 24,width: 24,)),
                            Text("Cabin (4)",style: FontStyles.s14TextW4,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 213,maxHeight: 24),
                      child:
                          Text("Booked",style: FontStyles.s16Success6,)
                    ),

                  ],
                ),
              ),
              SizedBox(height: 6,),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 470,maxHeight: 2
                ),
                color:  Color.fromRGBO(240, 240, 240, 1.0),
              ),
              SizedBox(height: 6,),
              Container(
                constraints: BoxConstraints(maxWidth: 470,maxHeight: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 213,maxHeight: 24),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 60,maxHeight: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.header,
                          border: Border.all(
                            width: 1,
                            color: AppColors.primary
                          )
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(child: Text("Cabin",style: FontStyles.s12PrimaryW5,)),
                      ),
                    ),
                    Container(
                        constraints: BoxConstraints(maxWidth: 213,maxHeight: 24),
                        child:
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Total:",style: FontStyles.s20HintW4
                              ),
                              TextSpan(
                                  text: "₹150",style: FontStyles.s20TextW4
                              )
                            ]
                        )),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _bar({
    required String title,
    required String title2,
    required String value,
    required String value2,
     bool visible = true,
  })
  {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 21,maxWidth: 470
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 213,maxHeight: 21),
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: title,style: FontStyles.s14HintW5
                  ),
                  TextSpan(
                    text: value,style: FontStyles.s14TextW4
                  )
                ]
              )),
            ),
            Expanded(
              child: Visibility(
                visible: visible,
                child: Container(
                  alignment: Alignment.centerRight,
                  constraints: BoxConstraints(maxWidth: 213,maxHeight: 21),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: title2,style: FontStyles.s14HintW5
                      ),
                      TextSpan(
                        text: value2,style: FontStyles.s14TextW4
                      )
                    ]
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  void _onClickBooking ()=> bookingsDetailsRoute.navigate;
}
