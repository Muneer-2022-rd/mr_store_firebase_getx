import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          TTexts.cart,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems(),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace / 2),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoute.checkout);
            },
            child: Text('${TTexts.checkout} \$750'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
