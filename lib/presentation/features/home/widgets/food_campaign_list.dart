import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/campaign_card.dart';
import 'package:foodie/presentation/features/home/widgets/campaign_shimmer.dart';

class FoodCampaignList extends StatelessWidget {
  const FoodCampaignList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Obx(() {
      final isLoading = controller.campaignLoading.value;
      final campaigns = controller.allCampaigns;

      // Empty state
      if (!isLoading && campaigns.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'No food campaign found',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      }

      // Use one unified layout builder
      if (ResponsiveHelper.isMobile(context)) {
        return _buildHorizontalLayout(
          context,
          width,
          height,
          isLoading: isLoading,
          campaigns: campaigns,
        );
      } else {
        return _buildGridLayout(
          context,
          isLoading: isLoading,
          campaigns: campaigns,
        );
      }
    });
  }

  // ---------- MOBILE (HORIZONTAL) LAYOUT ----------
  Widget _buildHorizontalLayout(
    BuildContext context,
    double width,
    double height, {
    required bool isLoading,
    required List campaigns,
  }) {
    final itemWidth = width * 0.7;
    final itemHeight = height * 0.14;

    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(isLoading ? 3 : campaigns.length, (index) {
            if (isLoading) {
              return SizedBox(
                width: itemWidth,
                height: itemHeight,
                child: const CampaignShimmer(),
              );
            }

            final campaign = campaigns[index];
            return SizedBox(
              width: itemWidth,
              height: itemHeight,
              child: CampaignCard(
                imageUrl: campaign.imageFullUrl ?? "",
                title: campaign.name ?? '',
                subtitle: campaign.description ?? '',
                rating: campaign.ratingCount ?? 0,
                price: campaign.price ?? 0,
                discountAmount: campaign.discount,
              ),
            );
          }),
        ),
      ),
    );
  }

  // ---------- WEB/TABLET GRID LAYOUT ----------
  Widget _buildGridLayout(
    BuildContext context, {
    required bool isLoading,
    required List campaigns,
  }) {
    final isTablet = ResponsiveHelper.isTablet(context);
    final crossAxisCount = isTablet ? 2 : 3;
    final aspectRatio = isTablet ? 3.0 : 3.5;

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
          if (isLoading) return const CampaignShimmer();
          final campaign = campaigns[index];
          return CampaignCard(
            imageUrl: campaign.imageFullUrl ?? "",
            title: campaign.name ?? '',
            subtitle: campaign.description ?? '',
            rating: campaign.ratingCount ?? 0,
            price: campaign.price ?? 0,
            discountAmount: campaign.discount,
          );
        }, childCount: isLoading ? 3 : campaigns.length),
      ),
    );
  }
}
