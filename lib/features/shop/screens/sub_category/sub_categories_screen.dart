import 'package:flutter/material.dart';

import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              RoundedImage(
                url: TImages.subCatCloth,
                applyRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: TSizes.spaceBtnSections),
              Column(
                children: [
                  SeactionHeading(
                    title: 'Cloth',
                    onPressed: () {},
                    showActionButton: true,
                  ),
                  SizedBox(height: TSizes.spaceBtnItems),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: TSizes.spaceBtnItems),
                      itemCount: 3,
                      itemBuilder: (context, index) => ProductCardHorizontal(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
