import 'package:flutter/material.dart';
import 'package:foodie/presentation/common/section_heading.dart';
import 'package:foodie/presentation/modules/home_page/widgets/categories_list.dart';
import 'package:foodie/presentation/modules/home_page/widgets/food_campaign_list.dart';
import 'package:foodie/presentation/modules/home_page/widgets/home_promo_slider.dart';
import 'package:foodie/presentation/modules/home_page/widgets/popular_food_list.dart';
import 'package:foodie/presentation/modules/home_page/widgets/resturants_list.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../widgets/top_location_search.dart';

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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverToBoxAdapter(child: TopLocationAndSearch()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: AppHomeSlider(controller: controller)),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Categories')),
            SliverToBoxAdapter(child: CategoriesList(controller: controller)),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Popular Food Nearby')),
            SliverToBoxAdapter(child: PopularFoodList(controller: controller)),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Food Campaign')),
            SliverToBoxAdapter(child: FoodCampaignList(controller: controller)),
            SliverToBoxAdapter(child: AppSectionHeading(text: 'Restaurant')),
            RestaurantsList(controller: controller),
          ],
        ),
      ),
    );
  }
}
