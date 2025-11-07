import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/core/utils/responsive_helper.dart';

class TopLocationAndSearch extends StatelessWidget {
  const TopLocationAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return !isMobile
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home_filled, color: greyColor),
                        SizedBox(width: 10),
                        Text(
                          "Sector 9, Uttara, Dhaka",
                          style: TextStyle(color: greyColor),
                        ),
                      ],
                    ),

                    Badge(child: Icon(Icons.notifications, color: greyColor)),
                  ],
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 4,
                  shadowColor: greyColor.withOpacity(0.3),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search food or restaurant here..",
                      enabled: true,
                      filled: true,
                      fillColor: whiteColor,
                      hintStyle: const TextStyle(color: greyColor),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      suffixIcon: Icon(Icons.search_outlined, color: greyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
