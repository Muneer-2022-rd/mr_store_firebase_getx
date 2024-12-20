import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      padding: EdgeInsets.all(TSizes.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(width: TSizes.spaceBtnItems / 2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      TTexts.orderProccessing,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: TColors.getPrimaryColor(context),
                          fontWeightDelta: 1),
                    ),
                    Text(
                      '07 Nov 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  textDirection == TextDirection.rtl
                      ? Iconsax.arrow_left_2
                      : Iconsax.arrow_right_34,
                  size: TSizes.iconSm,
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtnItems),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(width: TSizes.spaceBtnItems / 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(TTexts.order,
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            '[#34534]',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(width: TSizes.spaceBtnItems / 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            '16 Nov 2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
