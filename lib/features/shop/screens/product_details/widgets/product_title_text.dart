import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLine = 1,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });
  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.headlineSmall,
      overflow: overflow,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}
