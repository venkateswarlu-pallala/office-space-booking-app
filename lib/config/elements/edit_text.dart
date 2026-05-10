import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';

class EditText extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color fillColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  const EditText({
    super.key,
    this.controller,
    this.hintText = 'Enter text',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.fillColor = AppColors.white,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryButtonBg),
        ),
      ),
    );
  }
}
