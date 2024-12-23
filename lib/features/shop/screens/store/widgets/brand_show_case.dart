import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_card.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  final List<String> images;
  const BrandShowCase({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtnItems),
      padding: const EdgeInsets.only(
        left: TSizes.sm,
        top: TSizes.sm,
        bottom: TSizes.sm,
      ),
      child: Column(
        children: [
          BrandCard(
            showBorder: false,
            onTap: () {
              Get.toNamed(AppRoute.brandProducts);
            },
          ),
          SizedBox(height: TSizes.spaceBtnItems),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(TImages.logoImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
