import 'package:flutter/material.dart';

class BorderButton extends StatefulWidget {
  final VoidCallback onTap;

  /// MAIN TEXT ONLY
  final String text;

  /// STYLE
  final TextStyle? textStyle;

  /// Optional Icons
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  /// Spacing between icon and text
  final double iconSpacing;

  /// Border & style
  final Color? color;          // color for border + text (optional)
  final Color borderColor;     // border-only fallback
  final double borderWidth;
  final double radius;
  final Color? background;

  /// Padding
  final EdgeInsets padding;

  /// Animations
  final bool animateOnTap;
  final double tapScale;
  final Duration animationDuration;

  const BorderButton({
    super.key,
    required this.onTap,
    required this.text,

    this.textStyle,

    this.prefixIcon,
    this.suffixIcon,
    this.iconSpacing = 8,

    this.color, // <-- OPTIONAL COLOR

    this.borderColor = Colors.black,
    this.borderWidth = 1,
    this.radius = 10,
    this.background,

    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

    this.animateOnTap = true,
    this.tapScale = 0.94,
    this.animationDuration = const Duration(milliseconds: 90),
  });

  @override
  State<BorderButton> createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {
  bool _pressed = false;

  void _press(bool v) {
    if (widget.animateOnTap) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowItems = [];

    // ----------------------------------------------------------
    // CORRECT COLOR LOGIC
    // ----------------------------------------------------------
    final Color effectiveBorderColor =
        widget.color ?? widget.borderColor;

    final Color effectiveTextColor =
        widget.textStyle?.color ??
            (widget.color ?? Colors.black);

    // Prefix icon
    if (widget.prefixIcon != null) {
      rowItems.add(widget.prefixIcon!);
      rowItems.add(SizedBox(width: widget.iconSpacing));
    }

    // Text
    rowItems.add(
      Text(
        widget.text,
        style: widget.textStyle ??
            TextStyle(
              fontSize: 14,
              color: effectiveTextColor, // <-- FIXED
            ),
      ),
    );

    // Suffix icon
    if (widget.suffixIcon != null) {
      rowItems.add(SizedBox(width: widget.iconSpacing));
      rowItems.add(widget.suffixIcon!);
    }

    final content = Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(
          color: effectiveBorderColor, // <-- FIXED
          width: widget.borderWidth,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: rowItems,
      ),
    );

    return GestureDetector(
      onTapDown: (_) => _press(true),
      onTapUp: (_) {
        _press(false);
        widget.onTap();
      },
      onTapCancel: () => _press(false),

      child: AnimatedScale(
        scale: _pressed ? widget.tapScale : 1,
        duration: widget.animationDuration,
        child: content,
      ),
    );
  }
}
