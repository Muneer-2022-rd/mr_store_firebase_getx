import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_show_case.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandShowCase(images: [
                TImages.logoImage,
                TImages.logoImage,
                TImages.logoImage
              ]),
              BrandShowCase(images: [
                TImages.logoImage,
                TImages.logoImage,
                TImages.logoImage
              ]),
              SeactionHeading(
                title: TTexts.storeYouMightLike,
                showActionButton: true,
                buttonTitle: TTexts.homeShowAllButton,
              ),
              SizedBox(height: TSizes.spaceBtnItems),
              CustomGridLayout(
                itemCount: 3,
                itemBuilder: (context, index) => const ProductCardVertical(),
              ),
              SizedBox(height: TSizes.spaceBtnSections),
            ],
          ),
        ),
      ],
    );
  }
}
