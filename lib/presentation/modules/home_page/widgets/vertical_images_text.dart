import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/modules/home_page/widgets/banner_rounded_image.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    this.ontap,
    required this.image,
    required this.title,
    this.height = 80,
    this.width = 80,
    this.radius = 10,
  });

  final VoidCallback? ontap;

  final String image, title;
  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            AppRoundedImage(
              height: height,
              width: width,
              imageUrl: image,
              fit: BoxFit.cover,
              borderRadius: radius,
              padding: const EdgeInsets.all(10),
            ),

            SizedBox(
              width: 65,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: darkColor),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
