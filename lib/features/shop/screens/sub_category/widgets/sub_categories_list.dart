import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/sub_categories_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/category/category_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/sub_category_section_list.dart';

class SubCategoriesList extends StatefulWidget {
  final String categoryId;
  const SubCategoriesList({
    super.key,
    required this.categoryId,
  });

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  final controller = Get.put(SubCategoriesController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchSubCategories(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.subCategories.isEmpty) {
          return Center(child: Text('No Data Yet'));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.subCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  bottom: index != controller.subCategories.length - 1
                      ? TSizes.spaceBtnItems
                      : 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SeactionHeading(
                    title: controller.subCategories[index].name!,
                    onPressed: () => Get.to(() => CategoryProductsScreen(
                        category: controller.subCategories[index])),
                    showActionButton: true,
                  ),
                  SizedBox(height: TSizes.spaceBtnItems),
                  SubCategorySectionList(
                    categoryId: controller.subCategories[index].id!,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}