import 'package:flutter/material.dart';
class ResponsiveLayout extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const ResponsiveLayout({
    super.key,
    required this.children,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return isMobile
            ? Column(
          children: _withSpacing(children, Axis.vertical),
        )
            : Row(
          children: _withSpacing(children, Axis.horizontal),
        );
      },
    );
  }

  List<Widget> _withSpacing(List<Widget> children, Axis axis) {
    final spaced = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      spaced.add(children[i]);
      if (i != children.length - 1) {
        spaced.add(
          axis == Axis.vertical
              ? SizedBox(height: spacing)
              : SizedBox(width: spacing),
        );
      }
    }
    return spaced;
  }
}
