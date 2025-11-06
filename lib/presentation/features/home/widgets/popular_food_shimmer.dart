import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class PopularFoodShimmer extends StatelessWidget {
  const PopularFoodShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: greyColor.withOpacity(0.2),
          child: SizedBox(
            width: width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.15,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: whiteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: width * 0.4,
                        color: whiteColor,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 15,
                        width: width * 0.3,
                        color: whiteColor,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: width * 0.2,
                            color: whiteColor,
                          ),
                          Container(
                            height: 20,
                            width: width * 0.2,
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ],
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
