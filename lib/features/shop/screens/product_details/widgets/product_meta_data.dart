import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/products_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_with_verified_icon.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  final ProductModel product;
  const ProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductsController.instance;
    final textDirection = Directionality.of(context);
    final salePercentage =
        controller.calculatesalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            salePercentage == null
                ? SizedBox.shrink()
                : Positioned(
                    top: 12,
                    right: textDirection == TextDirection.rtl ? 10 : null,
                    left: textDirection == TextDirection.ltr ? 10 : null,
                    child: RoundedContainer(
                      raduis: TSizes.sm,
                      backgroundColor:
                          Colors.amberAccent.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: dark ? TColors.darkerGrey : TColors.white,
                            ),
                      ),
                    ),
                  ),
            const SizedBox(width: TSizes.spaceBtnItems),
            if (product.productType == ProductType.single.name &&
                product.salePrice > 0)
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Text(
                  product.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(decoration: TextDecoration.lineThrough),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child:
                  ProductPriceText(price: controller.getProductPrice(product)),
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        ProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        Row(
          children: [
            ProductTitleText(title: "${TTexts.status} :"),
            const SizedBox(width: TSizes.spaceBtnItems / 1.5),
            Text(product.stock.toString(),
                style: Theme.of(context).textTheme.titleLarge!)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 1.5),
        Row(
          children: [
            CircularImage(
              url: product.brand!.image!,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(width: TSizes.spaceBtnItems / 2),
            BrandTileWithVerifiedIcon(
              title: product.brand!.name!,
              barndTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
