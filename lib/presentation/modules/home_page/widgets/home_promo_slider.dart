import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/modules/home_page/controller/home_controller.dart';
import 'package:foodie/presentation/modules/home_page/widgets/banner_rounded_image.dart';
import 'package:foodie/presentation/modules/home_page/widgets/simmer_loader.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppHomeSlider extends StatelessWidget {
  const AppHomeSlider({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (controller.bannerLoading.value) {
        return AppShimmerLoader(width: width, height: height * 0.2);
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.allBanners
                  .map(
                    (banner) => Center(
                      child: AppRoundedImage(
                        imageUrl: banner.imageFullUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: height * 0.2,
                initialPage: controller.currentPageIndex.value,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),

            AnimatedSmoothIndicator(
              activeIndex: controller.currentPageIndex.value,
              count: controller.allBanners.length,
              effect: ScrollingDotsEffect(
                activeDotColor: lightGreenColor,
                dotColor: greyColor,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ],
        );
      }
    });
  }
}
