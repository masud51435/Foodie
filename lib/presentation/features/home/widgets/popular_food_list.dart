import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/app_vertical_product_card.dart';
import 'package:foodie/presentation/features/home/widgets/popular_food_shimmer.dart';

class PopularFoodList extends StatelessWidget {
  const PopularFoodList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Obx(() {
      final isLoading = controller.popularFoodLoading.value;
      final popularFoods = controller.popularFoods;

      // Empty state
      if (!isLoading && popularFoods.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'No popular food items available',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      }

      // Responsive builder
      if (ResponsiveHelper.isMobile(context)) {
        return _buildHorizontalList(
          context,
          width: width,
          isLoading: isLoading,
          products: popularFoods,
        );
      } else {
        return _buildGridList(
          context,
          isLoading: isLoading,
          products: popularFoods,
        );
      }
    });
  }

  // ---------- MOBILE (HORIZONTAL) LAYOUT ----------
  Widget _buildHorizontalList(
    BuildContext context, {
    required double width,
    required bool isLoading,
    required List products,
  }) {
    final cardWidth = width * 0.5;

    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(isLoading ? 5 : products.length, (index) {
            if (isLoading) {
              return SizedBox(
                width: cardWidth,
                child: const PopularFoodShimmer(),
              );
            }

            final product = products[index];
            return SizedBox(
              width: cardWidth,
              child: AppVerticalProductCard(
                product: product,
                controller: controller,
              ),
            );
          }),
        ),
      ),
    );
  }

  // ---------- TABLET/DESKTOP GRID LAYOUT ----------
  Widget _buildGridList(
    BuildContext context, {
    required bool isLoading,
    required List products,
  }) {
    final isTablet = ResponsiveHelper.isTablet(context);
    final crossAxisCount = isTablet ? 3 : 4;
    final aspectRatio = isTablet ? 1.0 : 1.55;

    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          if (isLoading) return const PopularFoodShimmer();
          final product = products[index];
          return AppVerticalProductCard(
            product: product,
            controller: controller,
          );
        }, childCount: isLoading ? 5 : products.length),
      ),
    );
  }
}
