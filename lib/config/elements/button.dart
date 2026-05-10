

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/font_styles.dart';
import 'anim_button.dart';

class Button extends StatelessWidget {
final VoidCallback onTap;
final String text;

final TextStyle? style;
final Color? background;
final Color? borderColor;
final double borderWidth;
final double width;
final double height;
final bool shadow;

final EdgeInsets padding;
final double radius;

final bool disable;
final bool loading;

final Widget? prefixIcon;
final Widget? suffixIcon;
final double gap;

const Button({
super.key,
required this.onTap,
required this.text,

this.style,
this.background,
this.borderColor,
this.borderWidth = 0,
this.width = double.infinity,
this.height = 50,
this.shadow = false,

this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
this.radius = 10,

this.disable = false,
this.loading = false,

this.prefixIcon,
this.suffixIcon,
this.gap = 8,
});

@override
Widget build(BuildContext context) {
final TextStyle txtStyle = style ?? FontStyles.s18TextW7;
final Color bg = background ?? AppColors.primary;

final List<Widget> rowItems = [];

if (prefixIcon != null) {
rowItems.add(prefixIcon!);
rowItems.add(SizedBox(width: gap));
}

rowItems.add(
AnimatedOpacity(
opacity: loading ? 0 : 1,
duration: const Duration(milliseconds: 150),
child: Text(text, style: txtStyle),
),
);

if (suffixIcon != null) {
rowItems.add(SizedBox(width: gap));
rowItems.add(suffixIcon!);
}

return AnimButton(
onTap: onTap,
disable: disable || loading,
loading: loading,
child: Container(
width: width,
height: height,
padding: padding,
decoration: BoxDecoration(
color: bg,
borderRadius: BorderRadius.circular(radius),
border: Border.all(
color: borderColor ?? Colors.transparent,
width: borderWidth,
),
boxShadow: shadow
? [
BoxShadow(
color: Colors.black,
blurRadius: 6,
offset: Offset(0, 3),
)
]
    : [],
),
child: Stack(
alignment: Alignment.center,
children: [
Row(mainAxisSize: MainAxisSize.min, children: rowItems),

if (loading)
SizedBox(
height: 18,
width: 18,
child: CircularProgressIndicator(
strokeWidth: 2.2,
valueColor: AlwaysStoppedAnimation<Color>(txtStyle.color!),
),
),
],
),
),
);
}
}

