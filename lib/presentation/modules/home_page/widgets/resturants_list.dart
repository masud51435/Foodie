import 'package:flutter/material.dart';
import 'package:foodie/presentation/modules/home_page/controller/home_controller.dart';
import 'package:foodie/presentation/modules/home_page/widgets/category_simmer.dart';
import 'package:foodie/presentation/modules/home_page/widgets/resturants_card.dart';
import 'package:get/get.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.restaurantsLoading.value) {
        return CategoryShimmer();
      }
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: controller.allRestaurants
              .map(
                (restaurant) => RestaurantsCard(
                  imageUrl: restaurant.coverPhotoFullUrl ?? '',
                  title: restaurant.name ?? '',
                  subtitle: restaurant.address ?? '',
                  rating: restaurant.avgRating ?? 0.0,
                  price: restaurant.priceStartsFrom ?? 0.0,
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
