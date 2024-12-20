import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:flutter/material.dart';

class BrandTileText extends StatelessWidget {
  final Color? color;
  final int maxLines;
  final String title;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;
  const BrandTileText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.copyWith(color: color)
          : brandTextSizes == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: color)
              : brandTextSizes == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: color)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: color),
    );
  }
}
