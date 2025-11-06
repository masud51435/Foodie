import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerLoader extends StatelessWidget {
  const AppShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.radius = 20,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: width * 0.1),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
