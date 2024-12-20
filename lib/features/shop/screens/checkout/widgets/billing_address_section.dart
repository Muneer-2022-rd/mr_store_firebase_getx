import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeactionHeading(
          title: TTexts.shippingAddress,
          buttonTitle: TTexts.change,
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.all(TSizes.sm),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: TSizes.spaceBtnItems),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Iconsax.user, size: TSizes.iconSm),
                                  const SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    'Muneer Radwan',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.sm),
                              const Row(
                                children: [
                                  Icon(Iconsax.call, size: TSizes.iconSm),
                                  SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    '0964628479',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.sm),
                              const Row(
                                children: [
                                  Icon(Iconsax.global, size: TSizes.iconSm),
                                  SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    'Syria - Homs - Alqosor',
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtnItems),
                      RoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.all(TSizes.sm),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: TSizes.spaceBtnItems),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Iconsax.user, size: TSizes.iconSm),
                                  const SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    'Muneer Radwan',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.sm),
                              const Row(
                                children: [
                                  Icon(Iconsax.call, size: TSizes.iconSm),
                                  SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    '0964628479',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.sm),
                              const Row(
                                children: [
                                  Icon(Iconsax.global, size: TSizes.iconSm),
                                  SizedBox(width: TSizes.spaceBtnItems),
                                  Text(
                                    'Syria - Homs - Alqosor',
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          showActionButton: true,
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        Padding(
          padding: const EdgeInsets.only(left: TSizes.spaceBtnItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.user, size: TSizes.iconSm),
                  const SizedBox(width: TSizes.spaceBtnItems),
                  Text(
                    'Muneer Radwan',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.sm),
              const Row(
                children: [
                  Icon(Iconsax.call, size: TSizes.iconSm),
                  SizedBox(width: TSizes.spaceBtnItems),
                  Text(
                    '0964628479',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.sm),
              const Row(
                children: [
                  Icon(Iconsax.global, size: TSizes.iconSm),
                  SizedBox(width: TSizes.spaceBtnItems),
                  Text(
                    'Syria - Homs - Alqosor',
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
