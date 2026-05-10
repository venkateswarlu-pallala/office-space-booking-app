import 'package:flutter/material.dart';
import 'package:homler/config/themes/app_colors.dart';

import '../themes/font_styles.dart';

class DropDownValue<T> {
  final T value;
  final String? label;

  DropDownValue({required this.value, this.label});
}

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final DropDownValue<T>? value;
  final String hint;
  final Widget Function(T value)? itemBuilder;
  final ValueChanged<T?> onChanged;
  final double borderRadius;
  final Color borderColor;
  final Color? fillColor;
  final EdgeInsets padding;
  final IconData? icon;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint = "Select",
    this.itemBuilder,
    this.borderRadius = 12,
    this.borderColor = Colors.grey,
    this.fillColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: fillColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColors.primaryButtonBg),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value?.value,
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),

          // ----------------------- SELECTED ITEM BUILDER -----------------------
          selectedItemBuilder: (context) {
            return items.map((item) {
              if (value != null && item == value!.value) {
                return Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      if (icon != null) Icon(icon, size: 20),
                      if (icon != null) const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          value!.label ?? item.toString(),
                          style: const TextStyle(
                            color: AppColors.hint,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }).toList();
          },

          // ----------------------- PLACEHOLDER (HINT) -----------------------
          hint: Padding(
            padding: padding,
            child: Text(
              hint,
              style:  FontStyles.s14HintW5,
            ),
          ),

          // ----------------------- MENU ITEMS -----------------------
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: itemBuilder != null
                  ? itemBuilder!(item)
                  : Text(item.toString()),
            );
          }).toList(),

          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
