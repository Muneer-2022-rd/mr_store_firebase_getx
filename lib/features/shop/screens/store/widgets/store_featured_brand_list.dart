import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/brands_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/brand/brand_products_screen.dart';

import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_card.dart';
import 'package:flutter/material.dart';

class StoreFeaturedBrandsList extends StatelessWidget {
  const StoreFeaturedBrandsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandsController());
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.featuredBrands.isEmpty) {
        return Center(child: Text('No Data Yet'));
      }
      return CustomGridLayout(
        itemCount: controller.featuredBrands.length,
        mainAxisExtent: 80,
        itemBuilder: (context, index) => BrandCard(
          showBorder: true,
          onTap: () => Get.to(() => BrandProductsScreen(brand: controller.featuredBrands[index])),
          brand: controller.featuredBrands[index],
        ),
      );
    });
  }
}
