import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/common/app_rounded_image.dart';
import 'package:foodie/presentation/features/home/widgets/home_slider_shimmer.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppHomeSlider extends StatefulWidget {
  const AppHomeSlider({super.key, required this.controller});

  final HomeController controller;

  @override
  State<AppHomeSlider> createState() => _AppHomeSliderState();
}

class _AppHomeSliderState extends State<AppHomeSlider> {
  PageController? _pageController;
  Timer? _timer;
  bool _autoPlayStarted = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.controller.currentPageIndex.value,
    );
  }

  @override
  void didUpdateWidget(covariant AppHomeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Restart auto-play if the widget updates and it's a web view
    if (!ResponsiveHelper.isMobile(context) &&
        !_autoPlayStarted &&
        widget.controller.allBanners.isNotEmpty) {
      _startAutoPlay();
      _autoPlayStarted = true;
    }
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _pageController?.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    if (_pageController == null) return;

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController!.hasClients &&
          widget.controller.allBanners.isNotEmpty) {
        int nextPage = widget.controller.currentPageIndex.value + 1;
        if (nextPage >= widget.controller.allBanners.length) {
          nextPage = 0;
        }
        _pageController!.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _stopAutoPlay() {
    _timer?.cancel();
    _autoPlayStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.controller.bannerLoading.value) {
        return const AppHomeSliderShimmer();
      } else {
        final isMobile = ResponsiveHelper.isMobile(context);
        final sliderHeight = MediaQuery.of(context).size.height * 0.2;

        if (widget.controller.allBanners.isEmpty) {
          _stopAutoPlay();
          return const SizedBox.shrink();
        }

        // Ensure auto-play is started/stopped correctly based on view
        if (!isMobile && !_autoPlayStarted) {
          _startAutoPlay();
          _autoPlayStarted = true;
        } else if (isMobile && _autoPlayStarted) {
          _stopAutoPlay();
        }

        if (isMobile) {
          return Column(
            children: [
              CarouselSlider(
                items: widget.controller.allBanners
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
                  height: sliderHeight,
                  initialPage: widget.controller.currentPageIndex.value,
                  onPageChanged: (index, _) =>
                      widget.controller.updatePageIndicator(index),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: widget.controller.currentPageIndex.value,
                count: widget.controller.allBanners.length,
                effect: ScrollingDotsEffect(
                  activeDotColor: lightGreenColor,
                  dotColor: greyColor,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ],
          );
        } else {
          // Web/Tablet View
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 5,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.controller.allBanners.length,
                      onPageChanged: (index) =>
                          widget.controller.updatePageIndicator(index),
                      itemBuilder: (context, index) {
                        final banner = widget.controller.allBanners[index];
                        return AppRoundedImage(
                          imageUrl: banner.imageFullUrl ?? '',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),

                AnimatedSmoothIndicator(
                  activeIndex: widget.controller.currentPageIndex.value,
                  count: widget.controller.allBanners.length,
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
    });
  }
}
