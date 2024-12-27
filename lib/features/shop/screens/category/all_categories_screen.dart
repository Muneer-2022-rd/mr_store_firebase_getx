import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_list_layout.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/categories_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/category/category_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "${TTexts.categoryTitle} ${TTexts.popular}",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.allCategories.isEmpty) {
                  return Center(child: Text('No Data Yet'));
                }
                return CustomListLayout(
                  itemCount: controller.allCategories.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: TSizes.spaceBtnItems),
                    child: GestureDetector(
                      onTap: () => Get.to(() => CategoryProductsScreen(
                          category: controller.allCategories[index])),
                      child: RoundedContainer(
                        borderColor: Colors.black,
                        child: Stack(
                          children: [
                            RoundedImage(
                              url: controller.allCategories[index].image!,
                              fit: BoxFit.contain,
                              networkUrl: true,
                              height: 180,
                              width: double.infinity,
                              padding: EdgeInsets.all(TSizes.defaultSpace / 2),
                            ),
                            RoundedContainer(
                              height: 180,
                              width: double.infinity,
                              backgroundColor:
                                  TColors.grey.withValues(alpha: 0.4),
                              child: Center(
                                child: RoundedContainer(
                                    width: 100,
                                    backgroundColor: Colors.white,
                                    padding:
                                        EdgeInsets.all(TSizes.defaultSpace / 2),
                                    child: Text(
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        controller.allCategories[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
