import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_icon.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_with_verified_icon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          // boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: RoundedImage(
                    url: TImages.productBlue,
                    applyRadius: true,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: textDirection == TextDirection.rtl ? 10 : null,
                  left: textDirection == TextDirection.ltr ? 10 : null,
                  child: RoundedContainer(
                    raduis: TSizes.sm,
                    backgroundColor: TColors.secondary.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: dark ? TColors.darkerGrey : TColors.white,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: textDirection == TextDirection.ltr ? 10 : null,
                  left: textDirection == TextDirection.rtl ? 10 : null,
                  child: const CircularIcon(
                    color: TColors.error,
                    icon: Iconsax.heart5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: TSizes.spaceBtnItems),
                      ProductTitleText(title: 'Sport Shirt', smallSize: true),
                      const SizedBox(height: TSizes.spaceBtnItems / 2),
                      BrandTileWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ProductPriceText(price: '256.0')),
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: textDirection == TextDirection.ltr
                                ? const Radius.circular(TSizes.cardRadiusMd)
                                : const Radius.circular(0),
                            bottomRight: textDirection == TextDirection.ltr
                                ? const Radius.circular(
                                    TSizes.productImageRadius)
                                : const Radius.circular(0),
                            topRight: textDirection == TextDirection.rtl
                                ? const Radius.circular(
                                    TSizes.productImageRadius)
                                : const Radius.circular(0),
                            bottomLeft: textDirection == TextDirection.rtl
                                ? const Radius.circular(
                                    TSizes.productImageRadius)
                                : const Radius.circular(0),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
