import 'package:flutter/material.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/app_vertical_product_card.dart';
import 'package:foodie/presentation/features/home/widgets/popular_food_shimmer.dart';
import 'package:get/get.dart';

class PopularFoodList extends StatelessWidget {
  const PopularFoodList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.popularFoodLoading.value) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
          child: Row(
            children: List.generate(
              5,
              (index) => const PopularFoodShimmer(),
            ),
          ),
        );
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: controller.popularFoods
              .map(
                (category) => AppVerticalProductCard(
                  product: category,
                  controller: controller,
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
