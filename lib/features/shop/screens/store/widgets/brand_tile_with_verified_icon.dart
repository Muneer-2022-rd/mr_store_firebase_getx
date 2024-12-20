import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandTileWithVerifiedIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? iconColor, textColor;
  final TextAlign? textAlign;
  final TextSizes barndTextSizes;
  const BrandTileWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.iconColor,
    this.textColor,
    this.textAlign = TextAlign.center,
    this.barndTextSizes = TextSizes.small,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTileText(
            title: title,
            brandTextSizes: barndTextSizes,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5,
            color: iconColor ?? TColors.getPrimaryColor(context),
            size: TSizes.iconXs)
      ],
    );
  }
}
