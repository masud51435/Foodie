
import 'package:flutter/material.dart';

import '../../../common/simmer_loader.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.width = 60,
    this.height = 60,
    this.textWidth = 60,
    this.textHeight = 12,
  });

  final double width, height, textWidth, textHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmerLoader(
          width: width,
          height: height,
          radius: 10,
        ),
        const SizedBox(
          height: 8,
        ),
        AppShimmerLoader(width: textWidth, height: textHeight),
      ],
    );
  }
}
