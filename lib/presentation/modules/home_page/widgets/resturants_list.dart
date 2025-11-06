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
        return const SliverToBoxAdapter(child: CategoryShimmer());
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < controller.allRestaurants.length) {
              final restaurant = controller.allRestaurants[index];
              return RestaurantsCard(
                imageUrl: restaurant.coverPhotoFullUrl ?? '',
                title: restaurant.name ?? '',
                subtitle: restaurant.address ?? '',
                rating: restaurant.avgRating ?? 0.0,
                price: restaurant.priceStartsFrom ?? 0.0,
              );
            }
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          childCount: controller.allRestaurants.length +
              (controller.restaurantsPaginating.value ? 1 : 0),
        ),
      );
    });
  }
}
