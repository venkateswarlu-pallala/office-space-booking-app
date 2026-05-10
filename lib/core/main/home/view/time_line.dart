import 'package:flutter/material.dart';
import 'package:homler/config/themes/font_styles.dart';

enum TimelinePosition {
  top,
  bottom,
}

class TimelineItem extends StatelessWidget {
  final String content;
  final String title;
  final TimelinePosition position;

  const TimelineItem({
    super.key,
    required this.content,
    required this.title,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          if (position == TimelinePosition.top) _topSection(),
          if (position == TimelinePosition.bottom) _bottomSection(),
        ],
      ),
    );
  }

  Widget _topSection() {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: FontStyles.s20TextW7,
        ),
         SizedBox(height: 6),
        Image.asset('assets/icons/ic_point.png'),
         SizedBox(height: 14),
        Image.asset('assets/icons/ic_linedown.png'),
         SizedBox(height: 12),
        Text(
          content,
          textAlign: TextAlign.center,
          style: FontStyles.s12TextW4,
        ),
      ],
    );
  }

  Widget _bottomSection() {
    return Column(
      children: [
        Text(
          content,
          textAlign: TextAlign.center,
          style: FontStyles.s12TextW4,
        ),
        const SizedBox(height: 12),
        Image.asset('assets/icons/ic_lineup.png'),
        const SizedBox(height: 14),
        Image.asset('assets/icons/ic_point.png'),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: FontStyles.s20TextW7,
        ),
      ],
    );
  }
}
