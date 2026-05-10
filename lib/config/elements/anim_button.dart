import 'package:flutter/material.dart';

class AnimButton extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  final Widget child;

  /// States
  final bool loading;
  final bool disable;

  /// Animation
  final Duration duration;
  final Curve curve;
  final double scale;

  /// Style
  final Color? background;
  final double radius;
  final EdgeInsets padding;
  final double? height;

  /// Disabled opacity (customizable)
  final double disabledOpacity;

  const AnimButton({
    super.key,
    required this.child,

    required this.onTap,
    this.onLongPress,

    this.loading = false,
    this.disable = false,

    this.duration = const Duration(milliseconds: 120),
    this.curve = Curves.easeOutBack,
    this.scale = 0.92,

    this.background,
    this.radius = 12,
    this.padding = const EdgeInsets.all(12),
    this.height,

    this.disabledOpacity = 0.5,
  });

  @override
  State<AnimButton> createState() => _AnimButtonState();
}

class _AnimButtonState extends State<AnimButton> {
  bool _pressed = false;

  bool get _isDisabled => widget.disable || widget.loading;

  void _press(bool p) {
    if (_isDisabled) return;
    setState(() => _pressed = p);
  }

  @override
  Widget build(BuildContext context) {
    final double opacity = _isDisabled ? widget.disabledOpacity : 1;

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),

      child: AnimatedScale(
        scale: _pressed ? widget.scale : 1,
        duration: widget.duration,
        curve: widget.curve,

        child: GestureDetector(
          behavior: HitTestBehavior.translucent,

          onTapDown: (_) => _press(true),
          onTapUp: (_) {
            _press(false);
            if (!_isDisabled) widget.onTap.call();
          },
          onTapCancel: () => _press(false),
          onLongPress: _isDisabled ? null : widget.onLongPress,

          child: Container(
            height: widget.height,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(widget.radius),
            ),

            child: Stack(
              alignment: Alignment.center,
              children: [
                // ACTUAL CHILD
                AnimatedOpacity(
                  opacity: widget.loading ? 0 : 1,
                  duration: const Duration(milliseconds: 150),
                  child: widget.child,
                ),

                // LOADER
                if (widget.loading)
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
