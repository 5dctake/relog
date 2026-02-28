import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final Function(double)? onRatingChanged;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 32.0,
    this.color = Colors.amber,
    this.onRatingChanged,
  });

  Widget buildStar(BuildContext context, int index) {
    IconData icon;
    if (index >= rating) {
      icon = Icons.star_border;
    } else if (index > rating - 1 && index < rating) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star;
    }

    final widget = Icon(
      icon,
      size: size,
      color: color,
    );

    if (onRatingChanged == null) {
      return widget;
    }

    return GestureDetector(
      onTapDown: (details) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final localPosition = box.globalToLocal(details.globalPosition);
        final starPosition = localPosition.dx - (index * size);
        double newRating = index + (starPosition < size / 2 ? 0.5 : 1.0);
        onRatingChanged!(newRating);
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => buildStar(context, index)),
    );
  }
}
