import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.text,
    this.smallSize = true,
    this.maxLine = 1,
    this.textAlign = TextAlign.left,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final String text;
  final bool smallSize;
  final int maxLine;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallSize
          ? Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(fontWeightDelta: 2, fontSizeDelta: 2)
          : Theme.of(context).textTheme.titleLarge,
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
