
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';

class AppBannerShimmer extends StatelessWidget {
  const AppBannerShimmer({
    super.key,
    this.height,
    this.width,
    this.radius = 16,
  });

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
    );
  }
}
