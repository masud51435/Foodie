import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    required this.text,
    this.textColor,
    this.onPressed,
  });

  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge!.apply(
              color: darkGreyColor,
              fontWeightDelta: 3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: lightGreenColor,
                decorationColor: lightGreenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
