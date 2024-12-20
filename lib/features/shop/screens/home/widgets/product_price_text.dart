import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final String currencySign, price;
  final int maxLine;
  final bool isLarge;
  final bool lineThrough;
  final TextOverflow overflow;
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLine,
      overflow: overflow,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
