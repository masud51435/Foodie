import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/modules/home_page/widgets/banner_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppHomeSliderShimmer extends StatelessWidget {
  const AppHomeSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 2000),
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(5, (index) {
              return const AppBannerShimmer();
            }),
            options: CarouselOptions(
              height: height * 0.19,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedSmoothIndicator(
            activeIndex: 0,
            count: 5,
            effect: ScrollingDotsEffect(
              activeDotColor: lightGreenColor,
              dotColor: greyColor,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ],
      ),
    );
  }
}
