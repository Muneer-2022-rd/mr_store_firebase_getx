import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'brand_with_title_text.dart';

class BrandWithTitleVerifyedIcon extends StatelessWidget {
  const BrandWithTitleVerifyedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.textSizes = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes textSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            maxLines: maxLines,
            title: title,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: textSizes,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconMd,
        )
      ],
    );
  }
}
