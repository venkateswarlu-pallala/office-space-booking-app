import 'package:flutter/material.dart';
import 'package:homler/config/elements/custom_drop_down.dart';
import 'package:homler/config/extensions/response_font_extension.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
import '../../../../config/elements/button.dart';
import '../../../../config/elements/edit_text.dart';

class FormQuickBook extends StatefulWidget {
  const FormQuickBook({super.key});

  @override
  State<FormQuickBook> createState() => _FormQuickBookState();
}

class _FormQuickBookState extends State<FormQuickBook> {
  DropDownValue<String>? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 2
            ),
          ]
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            spacing: 10,
            children: [
              Image.asset(
                'assets/icons/ic_quickbook.png',
                height: 32,
                width: 32,
              ),
              Expanded(child: Text("Quick Book", style: FontStyles.s24Text5)),
            ],
          ),

          Text("Choose Type", style: FontStyles.s14HintW5),

          CustomDropdown(
            items: ["seats", "cabin"],
            value: selected,
            onChanged: (val) {
              setState(() {
                selected = DropDownValue(value: val!, label: val);
              });
            },
          ),

          Text("Count", style: FontStyles.s14HintW5),
          EditText(
            fillColor: AppColors.white,
            hintText: "2",
            keyboardType: TextInputType.number,
          ),

          Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10),
            child:Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                    Text("Available near by", style: FontStyles.s12TextW4),
                    Text("Seats:", style: FontStyles.s12TextW4),
                    Text("32", style: FontStyles.s12HintW5),
                    Text("Cabins:", style: FontStyles.s12TextW4),
                    Text("32", style: FontStyles.s12HintW5)

            ],
          ),
    ),

          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Button(onTap: (){}, text: "Book Now",
            width: 176,style: FontStyles.s22WhiteW5,),
          ),
         ]
      ),
    );
  }
}
