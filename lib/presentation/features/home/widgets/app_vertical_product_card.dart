import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/data/models/popular_response_model.dart';
import 'package:foodie/presentation/features/home/controller/home_controller.dart';
import 'package:foodie/presentation/features/home/widgets/banner_rounded_image.dart';
import 'package:foodie/presentation/features/home/widgets/product_rating.dart';



class AppVerticalProductCard extends StatelessWidget {
  const AppVerticalProductCard({
    super.key,
    required this.product,
    required this.controller,
  });

  final Product product;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        elevation: 2,
        shadowColor: greyColor.withOpacity(0.2),
        child: SizedBox(
          width: width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.15,
                width: width * 0.5,
                child: AppRoundedImage(
                  imageUrl: product.imageFullUrl ?? '',
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${product.price.toString()}",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        ProductRating(rating: product.ratingCount.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
