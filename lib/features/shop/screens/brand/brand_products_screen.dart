import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/products_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/brand_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_card.dart';

class BrandProductsScreen extends StatefulWidget {
  final BrandModel brand;
  const BrandProductsScreen({super.key, required this.brand});

  @override
  State<BrandProductsScreen> createState() => _BrandProductsScreenState();
}

class _BrandProductsScreenState extends State<BrandProductsScreen> {
  final controller = ProductsController.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductsByBrand(widget.brand.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          widget.brand.name!,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true, brand: widget.brand),
              SizedBox(height: TSizes.spaceBtnSections),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                ),
                items: [
                  'name',
                  'max price',
                  'min price',
                  'sale',
                  'newest',
                  'popularity'
                ]
                    .map((filter) => DropdownMenuItem(
                          value: filter,
                          child: Text(filter),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: TSizes.spaceBtnSections),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.productsByBrand.isEmpty) {
                  return Center(child: Text('No Data Yet'));
                } else {
                  return CustomGridLayout(
                    itemCount: controller.productsByBrand.length,
                    itemBuilder: (context, index) => ProductCardVertical(
                        product: controller.productsByBrand[index]),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
