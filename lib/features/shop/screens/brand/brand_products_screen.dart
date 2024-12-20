import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_card.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Nike",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
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
              CustomGridLayout(
                itemCount: 20,
                itemBuilder: (context, index) => ProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
