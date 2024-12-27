import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/products_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';

class CategoryProductsScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryProductsScreen({super.key, required this.category});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final controller = ProductsController.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductsByCategory(widget.category.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          widget.category.name!,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
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
                } else if (controller.productsByCategory.isEmpty) {
                  return Center(child: Text('No Data Yet'));
                } else {
                  return CustomGridLayout(
                    itemCount: controller.productsByCategory.length,
                    itemBuilder: (context, index) => ProductCardVertical(
                        product: controller.productsByCategory[index]),
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
