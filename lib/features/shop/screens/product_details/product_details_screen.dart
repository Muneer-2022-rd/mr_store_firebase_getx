import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';

import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: <Widget>[
                  const RatingAndShareWidget(),
                  ProductMetaData(product: product),
                  if (product.productType == ProductType.variable.name)
                    ProductAttributes(product: product),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(TTexts.checkout),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnSections),
                  SeactionHeading(
                    title: TTexts.description,
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtnItems),
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    colorClickableText: TColors.getPrimaryColor(context),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: TTexts.readMore,
                    trimExpandedText: TTexts.readLess,
                    style: TextStyle(fontSize: 16),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeactionHeading(
                        title: '${TTexts.reviews} (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewsScreen()),
                        icon: Icon(
                          textDirection == TextDirection.rtl
                              ? Iconsax.arrow_left_2
                              : Iconsax.arrow_right_3,
                          size: 18,
                          color: dark ? TColors.white : TColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
