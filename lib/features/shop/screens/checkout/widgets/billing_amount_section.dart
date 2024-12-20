import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TTexts.subtotal,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TTexts.shippingFee,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$5.0",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TTexts.tax,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$7.0",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${TTexts.total} ${TTexts.order}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$262.0",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ],
    );
  }
}
