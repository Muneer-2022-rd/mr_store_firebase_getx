import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/sub_categories_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/sub_category_section.dart';

class SubCategoriesList extends StatelessWidget {
  final String categoryId;
  const SubCategoriesList({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubCategoriesController())
      ..fetchSubCategories(categoryId);
    return Obx(
      () {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.subCategories.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      bottom: index != controller.subCategories.length - 1
                          ? TSizes.spaceBtnItems
                          : 0),
                  child: SubCategorySection(
                      category: controller.subCategories[index]),
                ),
              );
      },
    );
  }
}
