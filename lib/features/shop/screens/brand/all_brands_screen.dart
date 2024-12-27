import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';

import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/brands_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/brand/brand_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_card.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "${TTexts.brands} ${TTexts.popular}",
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
                } else if (controller.allBrands.isEmpty) {
                  return Center(child: Text('No Data Yet'));
                }
                return CustomGridLayout(
                  itemCount: controller.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => BrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => BrandProductsScreen(brand: controller.allBrands[index])),
                    brand: controller.allBrands[index],
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
