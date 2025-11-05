import 'package:flutter/material.dart';
import 'package:foodie/presentation/modules/home_page/controller/home_controller.dart';
import 'package:foodie/presentation/modules/home_page/widgets/category_simmer.dart';
import 'package:foodie/presentation/modules/home_page/widgets/vertical_images_text.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(() {
      if (controller.categoryLoading.value) {
        return CategoryShimmer();
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.allCategories
              .map(
                (category) => AppVerticalImageText(
                  image: category.imageFullUrl ?? '',
                  title: category.name ?? '',
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
