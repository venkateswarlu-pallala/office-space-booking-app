import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final int reviews;
  final double starSize;
  final Color filledColor;
  final Color unfilledColor;

  const Rating({
    super.key,
    required this.rating,
    required this.reviews,
    this.starSize = 20,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,

  });

  @override
  Widget build(BuildContext context) {
    // Calculate full stars and half stars
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stars
          Row(
            children: List.generate(5, (index) {
              if (index < fullStars) {
                return Icon(Icons.star, color: filledColor, size: starSize);
              } else if (index == fullStars && hasHalfStar) {
                return Icon(Icons.star_half, color: filledColor, size: starSize);
              } else {
                return Icon(Icons.star_border, color: unfilledColor, size: starSize);
              }
            }),
          ),
          SizedBox(width: 8),

          // Rating text
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          // Reviews text
          Text(" ($reviews Reviews)"),
        ],
      ),
    );
  }
}
