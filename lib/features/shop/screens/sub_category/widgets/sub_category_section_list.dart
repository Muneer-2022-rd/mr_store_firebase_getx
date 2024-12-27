import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/products_by_category.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/product_card_horizontal.dart';

class SubCategorySectionList extends StatelessWidget {
  final String categoryId;
  const SubCategorySectionList({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsByCategoryController(), tag: categoryId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductsBySubCategory(categoryId);
    });

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.productsBySubCategory.isEmpty) {
        return Center(child: Text('No Data Yet'));
      } else {
        return SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: TSizes.spaceBtnItems),
            itemCount: controller.productsBySubCategory.length,
            itemBuilder: (context, index) => ProductCardHorizontal(
              product: controller.productsBySubCategory[index],
            ),
          ),
        );
      }
    });
  }
}
