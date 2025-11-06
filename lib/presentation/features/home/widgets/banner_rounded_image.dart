import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.topLeftRadius = 16,
    this.topRightRadius = 16,
    this.bottomLeftRadius = 16,
    this.bottomRightRadius = 16,
    required this.imageUrl,
    this.border,
    this.backgroundColor,
    this.color,
    this.fit,
    this.onPress,
    this.placeholderScale = 3,
    this.applyImageRadius = true,
  });

  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final double topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;
  final String imageUrl;
  final BoxBorder? border;
  final Color? backgroundColor, color;
  final BoxFit? fit;
  final double? placeholderScale;
  final bool applyImageRadius;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                  bottomRight: Radius.circular(bottomRightRadius),
                )
              : BorderRadius.zero,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/spinner.gif',
            fit: fit,
            color: color,
            image: imageUrl,
            imageErrorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: redColor);
            },
            placeholderFit: BoxFit.none,
            placeholderScale: placeholderScale,
          ),
        ),
      ),
    );
  }
}
