import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_with_verified_icon.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              raduis: TSizes.sm,
              backgroundColor: Colors.amberAccent.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtnItems),
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtnItems),
            const ProductPriceText(
              price: '150',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        const ProductTitleText(title: 'Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        Row(
          children: [
            ProductTitleText(title: "${TTexts.status} :"),
            const SizedBox(width: TSizes.spaceBtnItems / 1.5),
            Text(TTexts.inStock, style: Theme.of(context).textTheme.titleLarge!)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        Row(
          children: [
            CircularImage(
              url: TImages.brandNissan,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(width: TSizes.spaceBtnItems / 2),
            const BrandTileWithVerifiedIcon(
              title: 'Nike',
              barndTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
