import 'package:mr_store_getx_firebase/common/styles/shadow_style.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_icon.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/products_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const ProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsController.instance;
    final salePercentage =
        controller.calculatesalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
                padding: EdgeInsets.zero,
                backgroundColor: dark
                    ? TColors.darkGrey
                    : TColors.grey.withValues(alpha: 0.5),
                child: Stack(
                  children: [
                    RoundedImage(
                      width: double.infinity,
                      url: product.thumbnail,
                      applyRadius: true,
                      borderRadius: TSizes.cardRadiusLg,
                      networkUrl: true,
                      fit: BoxFit.cover,
                    ),
                    salePercentage == null
                        ? SizedBox.shrink()
                        : Positioned(
                            top: 12,
                            right:
                                textDirection == TextDirection.rtl ? 10 : null,
                            left:
                                textDirection == TextDirection.ltr ? 10 : null,
                            child: RoundedContainer(
                              raduis: TSizes.sm,
                              backgroundColor:
                                  Colors.amberAccent.withValues(alpha: 0.8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.sm, vertical: TSizes.xs),
                              child: Text(
                                '$salePercentage%',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: dark
                                          ? TColors.darkerGrey
                                          : TColors.white,
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
                      title: product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 2,
                      smallSize: true,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: TSizes.spaceBtnItems / 2),
                    Row(
                      children: [
                        Text(product.brand!.name!,
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
                        Flexible(
                          child: Row(
                            children: [
                              if (product.productType ==
                                      ProductType.single.name &&
                                  product.salePrice > 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: TSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: ProductPriceText(
                                    price: controller.getProductPrice(product)),
                              )
                            ],
                          ),
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
