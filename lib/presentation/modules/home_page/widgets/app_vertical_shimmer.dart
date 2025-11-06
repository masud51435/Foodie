import 'package:flutter/material.dart';
import 'package:foodie/presentation/modules/home_page/widgets/simmer_loader.dart';

class AppVerticalShimmer extends StatelessWidget {
  const AppVerticalShimmer({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmerLoader(width: 180, height: 180),
        SizedBox(height: 16),
        AppShimmerLoader(width: 160, height: 15),
        SizedBox(height: 8),
        AppShimmerLoader(width: 110, height: 15),
      ],
    );
  }
}
