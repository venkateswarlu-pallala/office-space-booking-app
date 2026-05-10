import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
// ignore: must_be_immutable
class EventsCard extends StatelessWidget {
  String location;
  String date;
  String content;
   EventsCard({
    required this.content,
     required this.location,
     required this.date,



  super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 401,
      ),
      padding: EdgeInsets.all(24),
      margin: EdgeInsetsGeometry.symmetric(vertical: 10),
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
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 353,
            ),
              child: Text(location,style: FontStyles.s20TextW4,)),

          Container(
            constraints: BoxConstraints(
              maxWidth: 170,
            ),
            child: Text(date,style: FontStyles.s14HintW5,),
          ),
          Container(constraints: BoxConstraints(maxWidth: 353,
          ),
          child: Text(content,style: FontStyles.s14HintW5,),)
        ],
      ),
    );
  }
}
