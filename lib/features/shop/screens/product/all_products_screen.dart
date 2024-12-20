import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "${TTexts.products} ${TTexts.popular}",
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
