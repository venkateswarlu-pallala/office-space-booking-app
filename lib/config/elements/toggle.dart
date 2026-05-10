import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  /// Height of track. Knob & width auto scale.
  final double size;

  // Colors
  final Color activeColor;
  final Color inactiveColor;
  final Color knobColor;

  // Animation
  final Duration duration;
  final Curve curve;

  // Optional knob icons — shown only if provided!
  final Widget? activeIcon;
  final Widget? inactiveIcon;

  // Labels
  final bool showLabels;
  final String activeText;
  final String inactiveText;
  final TextStyle? labelStyle;

  // Shadow
  final List<BoxShadow>? knobShadow;

  // Padding inside track
  final double padding;

  // Track width ratio → width = size * ratio
  final double widthRatio;

  const CustomToggle({
    super.key,
    required this.value,
    required this.onChanged,

    this.size = 20, // 🔥 default set to 24

    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.knobColor = Colors.white,

    this.duration = const Duration(milliseconds: 220),
    this.curve = Curves.easeOut,

    this.activeIcon, // Icons only appear if user passes them
    this.inactiveIcon,

    this.showLabels = false,
    this.activeText = 'On',
    this.inactiveText = 'Off',
    this.labelStyle,

    this.knobShadow,

    this.padding = 3,
    this.widthRatio = 1.9,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  final FocusNode _focusNode = FocusNode();

  void _toggle() => widget.onChanged(!widget.value);

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double trackHeight = widget.size;
    final double trackWidth = widget.size * widget.widthRatio;
    final double knobSize = trackHeight - widget.padding * 2;

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        if (event is KeyUpEvent &&
            (event.logicalKey == LogicalKeyboardKey.space ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          _toggle();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: _toggle,
        child: AnimatedContainer(
          duration: widget.duration,
          width: trackWidth,
          height: trackHeight,
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            color: widget.value ? widget.activeColor : widget.inactiveColor,
            borderRadius: BorderRadius.circular(widget.size),
          ),
          child: Stack(
            children: [
              if (widget.showLabels)
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: knobSize * 0.2,
                        ),
                        child: Text(
                          widget.inactiveText,
                          style:
                              widget.labelStyle ??
                              TextStyle(
                                fontSize: knobSize * 0.34,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withAlpha(widget.value ? 128:255 ),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: knobSize * 0.2,
                        ),
                        child: Text(
                          widget.activeText,
                          style:
                              widget.labelStyle ??
                              TextStyle(
                                fontSize: knobSize * 0.34,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withAlpha(widget.value ? 255 : 128),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

              AnimatedAlign(
                duration: widget.duration,
                curve: widget.curve,
                alignment: widget.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: knobSize,
                  height: knobSize,
                  decoration: BoxDecoration(
                    color: widget.knobColor,
                    shape: BoxShape.circle,
                    boxShadow:
                        widget.knobShadow ??
                        [
                          BoxShadow(
                            color: Colors.black.withAlpha(46),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                  ),

                  // ⭐ Show icon ONLY if user provided it
                  child:
                      (widget.value && widget.activeIcon != null) ||
                          (!widget.value && widget.inactiveIcon != null)
                      ? AnimatedSwitcher(
                          duration: widget.duration,
                          transitionBuilder: (child, anim) =>
                              ScaleTransition(scale: anim, child: child),
                          child: widget.value
                              ? widget.activeIcon
                              : widget.inactiveIcon,
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
