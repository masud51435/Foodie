import 'package:flutter/material.dart';
import 'package:foodie/presentation/common/section_heading.dart';
import 'package:foodie/presentation/features/home/widgets/categories_list.dart';
import 'package:foodie/presentation/features/home/widgets/food_campaign_list.dart';
import 'package:foodie/presentation/features/home/widgets/home_promo_slider.dart';
import 'package:foodie/presentation/features/home/widgets/popular_food_list.dart';
import 'package:foodie/presentation/features/home/widgets/resturants_list.dart';
import 'package:get/get.dart';

import 'package:foodie/core/utils/responsive_helper.dart';

import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/top_location_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        controller.hasMoreRestaurants) {
      controller.fetchAllRestaurants(offset: controller.restaurantPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverToBoxAdapter(child: TopLocationAndSearch()),

            SliverToBoxAdapter(child: AppHomeSlider(controller: controller)),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Categories')),
            CategoriesList(controller: controller),
            SliverToBoxAdapter(
              child: AppSectionHeading(text: 'Popular Food Nearby'),
            ),
            PopularFoodList(controller: controller),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Food Campaign')),
            FoodCampaignList(controller: controller),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Restaurant')),
            RestaurantsList(controller: controller),
          ],
        ),
      ),
    );
  }
}
