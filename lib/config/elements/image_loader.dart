import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double? radius;
  final BoxFit? fit;
  final String? alt;
  final Color? color;
  final double? size;
  final BorderRadius? borderRadius;

  const ImageLoader({
    super.key,
    required this.url,
    this.width = 400,
    this.height = 400,
    this.radius,
    this.fit,
    this.alt,
    this.borderRadius, this.color, this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _placeholder();

    return Semantics(
      label: alt ?? 'Image',
      image: true,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder:
              (context, imageProvider) => Image(
            image: imageProvider,
            width: size??width,
            height: size??height,
            color: color,
            fit: fit ?? BoxFit.cover,
            gaplessPlayback: true,
          ),
          placeholder:
              (context, url) => BlinkingPlaceholder(
            width: size??width,
            height: size??height,
            radius: radius,
          ),
          errorWidget: (context, url, error) => _error(),
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Semantics(
      label: alt ?? 'Placeholder image',
      image: true,
      child: Container(
        height: size??height,
        width: size??width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: const Center(
          child: Icon(Icons.image_rounded, color: AppColors.hint,),
        ),
      ),
    );

  }

  Widget _error() {
    return Container(
      height: size??height,
      width: size??width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
      child: const Center(
        child: Icon(Icons.broken_image_rounded, color: AppColors.hint,),
      ),
    );

  }
}

class BlinkingPlaceholder extends StatefulWidget {
  final double width;
  final double height;
  final double? radius;

  const BlinkingPlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  State<BlinkingPlaceholder> createState() => _BlinkingPlaceholderState();
}

class _BlinkingPlaceholderState extends State<BlinkingPlaceholder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.hint.withAlpha(70),
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
        ),
        child: const Center(
          child: Icon(Icons.image_rounded, color: AppColors.hint,),
        ),
      ),
    );
  }
}