import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/font_styles.dart';
class RaiseIssueSection extends StatelessWidget {
  const RaiseIssueSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 520),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              Center(
                child: Text(
                  "Raise an issue",
                  style: FontStyles.s20TextW6.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// SUBTITLE
              Center(
                child: Text(
                  "Share details about your booking issue so the Homler Bookings team can review and respond quickly.",
                  textAlign: TextAlign.center,
                  style: FontStyles.s12HintW5,
                ),
              ),

              const SizedBox(height: 25),

              /// FORM FIELDS
              _label("Mail (for updates)"),
              _inputField("Please enter mail here"),

              const SizedBox(height: 15),

              _label("Booking ID / Reference (optional)"),
              _inputField("Please enter Booking ID / Reference"),

              const SizedBox(height: 15),

              _label("Issue Type"),
              _dropdownField(),

              const SizedBox(height: 15),

              _label("What happened?"),
              _textArea(),

              const SizedBox(height: 20),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Submit Issue",style: FontStyles.s16WhiteW5,),
                ),
              ),

              const SizedBox(height: 10),

              /// FOOTER NOTE
              Center(
                child: Text(
                  "Once submitted, you will receive a ticket ID by email. Use it to follow up with our support team.",
                  textAlign: TextAlign.center,
                  style: FontStyles.s11GreyW5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _label(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: FontStyles.s16Text5,
    ),
  );
}
Widget _inputField(String hint) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: FontStyles.s12HintW5,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );
}
Widget _dropdownField() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    hint: const Text("Select issue"),
    items: ["Payment", "Booking", "Technical"]
        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList(),
    onChanged: (value) {},
  );
}
Widget _textArea() {
  return TextField(
    maxLines: 4,
    decoration: InputDecoration(
      hintText: "Explain your issue here",
      hintStyle: FontStyles.s12HintW5,
      contentPadding: const EdgeInsets.all(14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}