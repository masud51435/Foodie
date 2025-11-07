import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/widgets/banner_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppHomeSliderShimmer extends StatelessWidget {
  const AppHomeSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveHelper.isMobile(context);
    final sliderHeight = isMobile ? height * 0.19 : height * 0.38;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 2000),
      child: Column(
        children: [
          isMobile
              ? CarouselSlider(
                  items: List.generate(5, (index) {
                    return const AppBannerShimmer();
                  }),
                  options: CarouselOptions(
                    height: sliderHeight,
                    autoPlay: true,
                    enlargeCenterPage: isMobile,
                    viewportFraction: isMobile ? 0.8 : 1.0,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: SizedBox(
                    height: sliderHeight,
                    width: double.infinity,
                    child: AppBannerShimmer(radius: 0),
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
