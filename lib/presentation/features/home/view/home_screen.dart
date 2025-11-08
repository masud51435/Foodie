import 'package:flutter/material.dart';
import 'package:foodie/presentation/common/section_heading.dart';
import 'package:foodie/presentation/features/home/widgets/categories_list.dart';
import 'package:foodie/presentation/features/home/widgets/food_campaign_list.dart';
import 'package:foodie/presentation/features/home/widgets/home_promo_slider.dart';
import 'package:foodie/presentation/features/home/widgets/popular_food_list.dart';
import 'package:foodie/presentation/features/home/widgets/resturants_list.dart';
import 'package:foodie/presentation/features/home/widgets/top_location_search.dart';
import 'package:get/get.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => controller.refreshAll(),
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: TopLocationAndSearch(controller: controller),
              ),
              SliverToBoxAdapter(child: AppHomeSlider(controller: controller)),
              SliverToBoxAdapter(child: AppSectionHeading(text: 'Categories')),
              CategoriesList(controller: controller),
              SliverToBoxAdapter(
                child: AppSectionHeading(text: 'Popular Food Nearby'),
              ),
              PopularFoodList(controller: controller),
              SliverToBoxAdapter(
                child: AppSectionHeading(text: 'Food Campaign'),
              ),
              FoodCampaignList(controller: controller),
              SliverToBoxAdapter(child: AppSectionHeading(text: 'Restaurant')),
              RestaurantsList(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
