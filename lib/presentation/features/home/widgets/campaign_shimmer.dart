import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CampaignShimmer extends StatelessWidget {
  const CampaignShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          height: height * 0.139,
          width: width * 0.7,
          child: Card(
            elevation: 2,
            shadowColor: greyColor.withOpacity(0.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- LEFT IMAGE SECTION ----------
                Container(
                  width: width * 0.28,
                  height: double.infinity,
                  color: Colors.white,
                ),

                // ---------- RIGHT DETAILS SECTION ----------
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Container(
                          height: 20,
                          width: width * 0.3,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),

                        // Subtitle
                        Container(
                          height: 15,
                          width: width * 0.4,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 6),

                        // Rating
                        Row(
                          children: List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 2),
                              height: 16,
                              width: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Price and Add button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: width * 0.2,
                              color: Colors.white,
                            ),
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
