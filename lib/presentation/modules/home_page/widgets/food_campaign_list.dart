import 'package:flutter/material.dart';
import 'package:foodie/presentation/modules/home_page/controller/home_controller.dart';
import 'package:foodie/presentation/modules/home_page/widgets/campaign_card.dart';
import 'package:foodie/presentation/modules/home_page/widgets/category_simmer.dart';
import 'package:get/get.dart';

class FoodCampaignList extends StatelessWidget {
  const FoodCampaignList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.campaignLoading.value) {
        return CategoryShimmer();
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: controller.allCampaigns
              .map(
                (campaign) => CampaignCard(
                  imageUrl: campaign.imageFullUrl ?? "",
                  title: campaign.name ?? '',
                  subtitle: campaign.description ?? '',
                  rating: campaign.ratingCount ?? 0,
                  price: campaign.price ?? 0,
                  discountAmount: campaign.discount,
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
