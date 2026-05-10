import 'package:flutter/material.dart';

class StretchGrid extends StatelessWidget {
  /// Children for the grid
  final List<Widget> children;

  /// How many items in each row/column
  final int crossAxisCount;

  /// Gap between items
  final double spacing;

  /// Layout direction:
  /// Axis.horizontal → ROW-based grid  (DEFAULT)
  /// Axis.vertical   → COLUMN-based grid
  final Axis direction;

  /// Used only when direction == Axis.vertical
  final double height;

  const StretchGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = 12,
    this.direction = Axis.horizontal, // DEFAULT
    this.height = 400, // only applies in vertical mode
  });

  @override
  Widget build(BuildContext context) {
    return direction == Axis.horizontal
        ? _buildHorizontal()
        : _buildVertical();
  }

  // ---------------------------------------------------------------------------
  // HORIZONTAL MODE (your original StretchGrid)
  // ---------------------------------------------------------------------------
  Widget _buildHorizontal() {
    final rows = <Widget>[];

    for (int i = 0; i < children.length; i += crossAxisCount) {
      final rowChildren = children.skip(i).take(crossAxisCount).toList();

      // add empty slots
      while (rowChildren.length < crossAxisCount) {
        rowChildren.add(const SizedBox());
      }

      rows.add(
        Row(
          children: List.generate(crossAxisCount, (index) {
            final isLast = index == crossAxisCount - 1;

            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : spacing),
                child: rowChildren[index],
              ),
            );
          }),
        ),
      );

      if (i + crossAxisCount < children.length) {
        rows.add(SizedBox(height: spacing));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }

  // ---------------------------------------------------------------------------
  // VERTICAL MODE (new)
  // ---------------------------------------------------------------------------
  Widget _buildVertical() {
    final columns = <Widget>[];

    for (int i = 0; i < children.length; i += crossAxisCount) {
      final colChildren = children.skip(i).take(crossAxisCount).toList();

      // add empty slots
      while (colChildren.length < crossAxisCount) {
        colChildren.add(const SizedBox());
      }

      columns.add(
        Expanded(
          child: Column(
            children: List.generate(crossAxisCount, (index) {
              final isLast = index == crossAxisCount - 1;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : spacing),
                  child: colChildren[index],
                ),
              );
            }),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(columns.length, (index) {
          final isLast = index == columns.length - 1;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : spacing),
              child: columns[index],
            ),
          );
        }),
      ),
    );
  }
}
