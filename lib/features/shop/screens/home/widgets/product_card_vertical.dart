import 'package:mr_store_getx_firebase/common/styles/shadow_style.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_icon.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RoundedContainer(
                backgroundColor: dark
                    ? TColors.darkGrey
                    : TColors.grey.withValues(alpha: 0.5),
                child: Stack(
                  children: [
                    RoundedImage(
                      width: double.infinity,
                      url: TImages.productThmbnail,
                      applyRadius: true,
                      borderRadius: 25,
                    ),
                    Positioned(
                      top: 12,
                      right: textDirection == TextDirection.rtl ? 10 : null,
                      left: textDirection == TextDirection.ltr ? 10 : null,
                      child: RoundedContainer(
                        raduis: TSizes.sm,
                        backgroundColor:
                            TColors.secondary.withValues(alpha: 0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                color:
                                    dark ? TColors.darkerGrey : TColors.white,
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
            ),
            const SizedBox(height: TSizes.spaceBtnItems / 2),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  left: textDirection == TextDirection.ltr ? TSizes.sm : 0.0,
                  right: textDirection == TextDirection.rtl ? TSizes.sm : 0.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      title: TTexts.productTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 2,
                      smallSize: true,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: TSizes.spaceBtnItems / 2),
                    Row(
                      children: [
                        Text(TTexts.brandTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: TSizes.xs),
                        Icon(
                          Iconsax.verify5,
                          color: TColors.getPrimaryColor(context),
                          size: TSizes.iconXs,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ProductPriceText(
                          price: '35.5',
                          isLarge: true,
                          currencySign: '\$',
                        ),
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
      ),
    );
  }
}
