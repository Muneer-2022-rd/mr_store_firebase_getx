import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/device/utility.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/cart/widgets/product_quantity_with_add_remove.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';

class CartItems extends StatelessWidget {
  final bool showAddRemoveButton;
  const CartItems({super.key, this.showAddRemoveButton = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          const CartItem(),
          if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBtnItems),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductQuantityWithAddRemove(),
                ProductPriceText(price: '250')
              ],
            ),
          if (index == 3 && showAddRemoveButton == true) ...[
            SizedBox(
              height: TDeviceUtility.getBottomNavigationHeight() +
                  TSizes.spaceBtnItems,
            )
          ]
        ],
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtnSections),
      itemCount: 4,
    );
  }
}
