
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';

class AppRoundedContainer extends StatelessWidget {
  const AppRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.radius = 16,
    this.margin,
    this.padding,
    this.color = Colors.transparent,
    this.borderColor = whiteColor,
    this.showBorder = false,
    this.child,
    this.onTap,
  });

  final double? height, width;
  final double radius;
  final EdgeInsetsGeometry? margin, padding;
  final Color color, borderColor;
  final bool showBorder;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          border: showBorder ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
