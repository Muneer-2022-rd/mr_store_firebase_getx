import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/order/widgets/order_card.dart';

class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => OrderCard(),
      separatorBuilder: (context, index) =>
          SizedBox(height: TSizes.spaceBtnItems),
      itemCount: 7,
    );
  }
}
