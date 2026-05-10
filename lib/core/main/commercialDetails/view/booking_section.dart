import 'package:flutter/material.dart';
import 'package:homler/config/themes/gradient_style.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.header,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              GradientText(text: "Choose your seat/cabin",
                gradient: AppColors.darkGlowGradient,
                style: FontStyles.s32Linear4,
              ),
              SizedBox(height: 30),

              Wrap(
                spacing: 60,
                runSpacing: 30,
                children: [

                  /// LEFT SIDE (Seats Grid)
                  _seatSelector(),

                  /// RIGHT SIDE (Booking Details)
                  _bookingDetails()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}Widget _seatSelector() {
  return SizedBox(
    width: 450,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// DAY SELECT
        Wrap(
          spacing: 10,
          children: [
            _tabButton("Day", true),
            _tabButton("Night", false),
            _tabButton("Full Day", false),
          ],
        ),

        SizedBox(height: 20),

        Divider(),

        SizedBox(height: 20),

        /// CABIN FILTER
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            _cabinButton("1 Cabin(3)", true),
            _cabinButton("2 Cabin(3)", true),
            _cabinButton("Cabin(3)", false),
            _cabinButton("Cabin(2)", false),
          ],
        ),

        SizedBox(height: 20),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(24, (index) {
            return _seatBox(index + 1);
          }),
        ),
      ],
    ),
  );
}
Widget _seatBox(int number) {
  bool isSelected = number <= 3;

  return Container(
    width: 40,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isSelected
          ? AppColors.primary
          : Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      "$number",
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    ),
  );
}
Widget _tabButton(String text, bool active) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: active ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.primary),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: active ? Colors.white : AppColors.primary,
      ),
    ),
  );
}
Widget _cabinButton(String text, bool active) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      color: active ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: active ? Colors.white : Colors.black,
      ),
    ),
  );
}
Widget _bookingDetails() {
  return SizedBox(
    width: 400,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Booking Details",
            style: FontStyles.s20TextW6,

          ),
        ),

        SizedBox(height: 20),

        /// DATE FIELDS
        Row(
          children: [
            Expanded(
              child: _dateField("From"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _dateField("To"),
            ),
          ],
        ),

        SizedBox(height: 20),

        /// BOOKING SUMMARY
        _priceRow("Selected: 3 Seats", "2 Days (Day)"),
        _priceRow("3 x 199.0", "₹897.0"),

        SizedBox(height: 10),

        _priceRow("Selected: 2 Seats", "2 Days (Day)"),
        _priceRow("3 x 199.0", "₹897.0"),

        SizedBox(height: 10),

        _priceRow("Total", "₹977.0",
        ),
        _priceRow("GST (12%)", "₹80.0"),

        SizedBox(height: 20),

        _priceRow(
          "Payable Amount",
          "₹977.0",
          bold: true,
        ),

        SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text("Book Now",style: FontStyles.s20WhiteW5,),
          ),
        )
      ],
    ),
  );
}
Widget _dateField(String hint) {
  return TextField(
    decoration: InputDecoration(
      fillColor: AppColors.white,
      hintText: hint,
      suffixIcon: Icon(Icons.calendar_today),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
Widget _priceRow(String left, String right, {bool bold = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: bold
              ? FontStyles.s16Text5
              : FontStyles.s14HintW5,
        ),
        Text(
          right,
          style: bold
              ? FontStyles.s16Text5
              : FontStyles.s14HintW5,
        ),
      ],
    ),
  );
}
