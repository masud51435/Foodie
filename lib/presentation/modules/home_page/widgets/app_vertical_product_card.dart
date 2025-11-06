import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/model/popular_response_model.dart';
import 'package:foodie/presentation/modules/home_page/controller/home_controller.dart';
import 'package:foodie/presentation/modules/home_page/widgets/banner_rounded_image.dart';
import 'package:foodie/presentation/modules/home_page/widgets/product_rating.dart';
import 'package:foodie/presentation/modules/home_page/widgets/product_title_text.dart';

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
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(text: product.name ?? ''),
                    SizedBox(height: 5),
                    Text(
                      product.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: greyColor),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$${product.price.toString()}",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontWeightDelta: 2,
                        fontSizeDelta: 1,
                      ),
                    ),
                    ProductRating(rating: product.ratingCount.toString()),
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
