import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/resturants_card.dart';
import 'package:foodie/presentation/features/home/widgets/restaurants_shimmer.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.restaurantsLoading.value;
      final isPaginating = controller.restaurantsPaginating.value;
      final restaurants = controller.allRestaurants;

      // If loading
      if (isLoading) {
        return _buildGrid(
          context,
          itemCount: 6,
          builder: (context, index) => const RestaurantsShimmer(),
        );
      }

      // Empty state
      if (restaurants.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No restaurants available',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      }

      // Data state with pagination
      return _buildGrid(
        context,
        itemCount: restaurants.length + (isPaginating ? 1 : 0),
        builder: (context, index) {
          if (index < restaurants.length) {
            final restaurant = restaurants[index];
            return RestaurantsCard(
              imageUrl: restaurant.coverPhotoFullUrl ?? '',
              title: restaurant.name ?? '',
              subtitle: restaurant.address ?? '',
              rating: restaurant.avgRating ?? 0.0,
              price: restaurant.priceStartsFrom ?? 0.0,
            );
          }

          // Pagination spinner
          return Center(
            child: Image.asset(
              'assets/images/spinner.gif',
              height: 50,
              width: 50,
            ),
          );
        },
      );
    });
  }

  // ---------- Common Grid Builder ----------
  Widget _buildGrid(
    BuildContext context, {
    required int itemCount,
    required Widget Function(BuildContext, int) builder,
  }) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final crossAxisCount = isMobile
        ? 1
        : isTablet
        ? 2
        : 3;

    final aspectRatio = isMobile
        ? 2.9
        : isTablet
        ? 2.6
        : 3.5;

    final horizontalPadding = isMobile ? 8.0 : 16.0;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: 20,
          mainAxisSpacing: isMobile ? 0 : 20,
        ),
        delegate: SliverChildBuilderDelegate(builder, childCount: itemCount),
      ),
    );
  }
}
