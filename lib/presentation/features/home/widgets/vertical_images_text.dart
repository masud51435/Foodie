import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/features/home/widgets/banner_rounded_image.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.height = 80,
    this.width = 80,
  });

  final VoidCallback? onTap;

  final String image, title;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppRoundedImage(
            height: height,
            width: width,
            imageUrl: image,

            fit: BoxFit.cover,
            padding: const EdgeInsets.all(10),
          ),

          SizedBox(
            width: textWidth * 0.2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.apply(
                color: darkColor,
                fontWeightDelta: 1,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
