import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantsShimmer extends StatelessWidget {
  const RestaurantsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double cardHeight = size.height * 0.139;
    final double imageWidth = size.width * 0.3;

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          height: cardHeight,
          child: Card(
            elevation: 2,
            shadowColor: greyColor.withOpacity(0.2),
            child: Row(
              children: [
                // ---------- IMAGE ----------
                Container(
                  width: imageWidth,
                  height: double.infinity,
                  color: Colors.white,
                ),

                // ---------- CONTENT ----------
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title & Favorite
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: size.width * 0.4,
                              color: Colors.white,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        // Subtitle
                        Container(
                          height: 15,
                          width: size.width * 0.3,
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

                        // Price + Add Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: size.width * 0.2,
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
