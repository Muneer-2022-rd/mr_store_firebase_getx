import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/curved_widget.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/sub_categories_list.dart';

class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;
  const SubCategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name!,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurvedEdgesWidget(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    color: dark ? TColors.darkerGrey : TColors.light,
                    width: double.infinity,
                    child: CachedNetworkImage(imageUrl: category.image!),
                  ),
                  SizedBox(height: TSizes.spaceBtnItems)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: SubCategoriesList(categoryId: category.id!),
            ),
          ],
        ),
      ),
    );
  }
}
