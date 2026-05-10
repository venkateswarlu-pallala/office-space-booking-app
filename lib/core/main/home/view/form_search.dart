import 'package:flutter/material.dart';
import 'package:homler/config/themes/font_styles.dart';

import '../../../../config/elements/custom_drop_down.dart';
import '../../../../config/extensions/response_font_extension.dart';
import '../../../../config/themes/app_colors.dart';


class FormSearch extends StatefulWidget {
  const FormSearch({super.key});

  @override
  State<FormSearch> createState() => _FormSearchState();
}

class _FormSearchState extends State<FormSearch> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  String selectedOption = "Seat";

  DropDownValue<String>? selected;

  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 800,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
              boxShadow: [
          BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25098039215686274),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 2
        ),
        ]
          ),
          padding:  EdgeInsets.all(16.sp),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 14.sp,
            children: [

              Row(
                spacing: 10,
                children: [
                  Image.asset('assets/icons/icon_search.png', height: 24),
                  Expanded(child: Text("Find your choice", style: FontStyles.s16Text5)),
                ],
              ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.sp,
                  children: [
                    _buildOptionButton("Seat"),
                    _buildOptionButton("Cabin"),
                    _buildOptionButton("Lease"),
                  ],
                ),
              ),


              Text("Location", style: FontStyles.s14HintW5),

              SizedBox(
                height: 52,
                width: double.infinity,
                child: CustomDropdown<String>(
                  items: ["Hyderabad", "Bangalore", "Chennai"],
                  value: selected,
                  hint: "Search Location",
                  icon: Icons.location_on,
                  onChanged: (val) {
                    setState(() {
                      selected = DropDownValue(value: val!, label: val);
                    });
                  },
                ),
              ),


              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("From", style: FontStyles.s14HintW5),
                         SizedBox(height: 6),
                        SizedBox(
                          height: 52,
                          child: TextFormField(
                            controller: fromDateController,
                            readOnly: true,
                            onTap: () => _pickDate(fromDateController),
                            decoration: InputDecoration(
                              hintText: "Pick date",
                              suffixIcon: const Icon(Icons.calendar_today_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("To", style: FontStyles.s14HintW5),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 52,
                          child: TextFormField(
                            controller: toDateController,
                            readOnly: true,
                            onTap: () => _pickDate(toDateController),
                            decoration: InputDecoration(
                              hintText: "Pick date",
                              suffixIcon: const Icon(Icons.calendar_today_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 48,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonBg,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Search", style: FontStyles.s22WhiteW5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text) {
    final bool isSelected = (text == selectedOption);

    return SizedBox(
      height: 40,
      width: 98,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
          isSelected ? AppColors.primaryButtonBg : AppColors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide.none
                : const BorderSide(color: Colors.black, width: 1.3),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedOption = text;
          });
        },
        child: Text(
          text,
          style: isSelected ? FontStyles.s22WhiteW5 : FontStyles.s16Text5,
        ),
      ),
    );
  }
}
