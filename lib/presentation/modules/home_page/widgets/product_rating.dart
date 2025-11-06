import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: lightGreenColor, size: 15),

        Text(
          rating,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.apply(color: lightGreenColor),
        ),
      ],
    );
  }
}
