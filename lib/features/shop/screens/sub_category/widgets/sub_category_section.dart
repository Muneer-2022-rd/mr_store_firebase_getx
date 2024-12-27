import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/category/category_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/sub_category_section_list.dart';

class SubCategorySection extends StatelessWidget {
  final CategoryModel category;
  const SubCategorySection({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SeactionHeading(
          title: category.name!,
          onPressed: () =>
              Get.to(() => CategoryProductsScreen(category: category)),
          showActionButton: true,
        ),
        SizedBox(height: TSizes.spaceBtnItems),
        SubCategorySectionList(categoryId: category.id!)
      ],
    );
  }
}