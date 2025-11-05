
import 'package:flutter/material.dart';
import 'package:foodie/presentation/modules/home_page/widgets/simmer_loader.dart';


class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 8});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.13,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerLoader(
                width: 60,
                height: 60,
                radius: 10,
              ),
              SizedBox(
                height: 8,
              ),
              AppShimmerLoader(width: 60, height: 12),
            ],
          );
        },
      ),
    );
  }
}
