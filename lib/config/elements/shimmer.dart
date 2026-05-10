import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  final double height;
  final double width;
  final double radius;

  const Shimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 0, // default
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Colors.grey.shade300,
                  Colors.grey.shade100,
                  Colors.grey.shade300,
                ],
                stops: const [0.1, 0.5, 0.9],
                begin: Alignment(-1.0 + 2.0 * _controller.value, -0.3),
                end: Alignment(1.0 + 2.0 * _controller.value, 0.3),
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              height: widget.height,
              width: widget.width,
              color: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
