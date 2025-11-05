import 'package:flutter/material.dart';
import 'package:foodie/presentation/common/section_heading.dart';
import 'package:foodie/presentation/modules/home_page/widgets/categories_list.dart';
import 'package:foodie/presentation/modules/home_page/widgets/home_promo_slider.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../widgets/top_location_search.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopLocationAndSearch(),
              const SizedBox(height: 16),
              AppHomeSlider(controller: controller),
              AppSectionHeading(text: 'Categories'),
              CategoriesList(controller: controller),
              AppSectionHeading(text: 'Popular Food Nearby'),
            ],
          ),
        ),
      ),
    );
  }
}
