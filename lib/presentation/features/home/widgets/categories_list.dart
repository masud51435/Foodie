import 'package:flutter/material.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/category_simmer.dart';
import 'package:foodie/presentation/features/home/widgets/vertical_images_text.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.categoryLoading.value;
      final categories = controller.allCategories;

      // Empty state
      if (!isLoading && categories.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'No categories found',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      }

      if (ResponsiveHelper.isMobile(context)) {
        return _buildHorizontalList(
          context,
          isLoading: isLoading,
          categories: categories,
        );
      } else {
        return _buildGridList(
          context,
          isLoading: isLoading,
          categories: categories,
        );
      }
    });
  }

  // ---------- MOBILE (HORIZONTAL) LAYOUT ----------
  Widget _buildHorizontalList(
    BuildContext context, {
    required bool isLoading,
    required List categories,
  }) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Row(
          children: List.generate(isLoading ? 8 : categories.length, (index) {
            if (isLoading) {
              return const SizedBox(
                width: 80,
                child: CategoryShimmer(
                  width: 60,
                  height: 60,
                  textWidth: 60,
                  textHeight: 12,
                ),
              );
            }
            final category = categories[index];
            return SizedBox(
              width: 80,
              child: AppVerticalImageText(
                image: category.imageFullUrl ?? '',
                title: category.name ?? '',
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
    required List categories,
  }) {
    final isTablet = ResponsiveHelper.isTablet(context);
    final crossAxisCount = isTablet ? 4 : 6;
    final itemWidth = isTablet ? 100.0 : 120.0;
    final itemHeight = isTablet ? 110.0 : 131.0;

    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: itemWidth / itemHeight,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          if (isLoading) {
            return CategoryShimmer(
              width: itemWidth * 1.5,
              height: itemHeight * 1.5,
              textWidth: itemWidth * 0.8,
              textHeight: 12,
            );
          }
          final category = categories[index];
          return SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: AppVerticalImageText(
              image: category.imageFullUrl ?? '',
              title: category.name ?? '',
            ),
          );
        }, childCount: isLoading ? crossAxisCount * 2 : categories.length),
      ),
    );
  }
}
