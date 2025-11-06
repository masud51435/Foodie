import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/features/home/widgets/banner_rounded_image.dart';

class RestaurantsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;
  final num price;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;
  final VoidCallback? onFavorite;

  const RestaurantsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    this.onTap,
    this.onAdd,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double cardHeight = size.height * 0.139;
    final double imageWidth = size.width * 0.3;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 12),
        child: SizedBox(
          height: cardHeight,
          child: Card(
            elevation: 2,
            shadowColor: greyColor.withOpacity(0.2),
            child: Row(
              children: [
                // ---------- IMAGE ----------
                AppRoundedImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: double.infinity,
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
                            Expanded(
                              child: Text(
                                title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            InkWell(
                              onTap: onFavorite,
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: isFavorite
                                    ? Colors.redAccent
                                    : Colors.grey.shade400,
                                size: 20,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        // Subtitle
                        Text(
                          subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 6),

                        // Rating
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                index < rating.round()
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Price + Add Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${price.toStringAsFixed(2)}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            InkWell(
                              onTap: onAdd,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 18,
                                ),
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
