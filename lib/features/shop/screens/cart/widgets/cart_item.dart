import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_with_verified_icon.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          url: TImages.productBlue,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtnItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BrandTileWithVerifiedIcon(title: TTexts.brandTitle),
            Flexible(
              child: ProductTitleText(
                title: TTexts.productTitle,
                maxLine: 1,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: TTexts.color,
                      style: Theme.of(context).textTheme.bodySmall),
                  const WidgetSpan(
                    child: SizedBox(width: TSizes.spaceBtnItems / 2),
                  ),
                  TextSpan(
                      text: 'green',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const WidgetSpan(
                    child: SizedBox(width: TSizes.spaceBtnItems / 2),
                  ),
                  TextSpan(
                      text: TTexts.size,
                      style: Theme.of(context).textTheme.bodySmall),
                  const WidgetSpan(
                    child: SizedBox(width: TSizes.spaceBtnItems / 2),
                  ),
                  TextSpan(
                      text: 'XL', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
