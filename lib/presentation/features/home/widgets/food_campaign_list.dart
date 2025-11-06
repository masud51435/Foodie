import 'package:flutter/material.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/campaign_card.dart';
import 'package:foodie/presentation/features/home/widgets/campaign_shimmer.dart';
import 'package:get/get.dart';

class FoodCampaignList extends StatelessWidget {
  const FoodCampaignList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.campaignLoading.value) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
          child: Row(
            children: List.generate(
              3,
              (index) => const CampaignShimmer(),
            ),
          ),
        );
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
