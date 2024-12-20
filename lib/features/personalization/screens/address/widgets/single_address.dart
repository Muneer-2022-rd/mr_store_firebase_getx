import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    this.onTapAvailable,
    this.onTapDelete,
    required this.selectedAddress,
  });

  final void Function()? onTapAvailable;
  final void Function()? onTapDelete;
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? Theme.of(context).primaryColor.withValues(alpha: 0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtnItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muneer Radwan',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '0964628479',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                'Office',
                softWrap: true,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                'Syria - Homs - Alqosor',
                softWrap: true,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: onTapAvailable,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle : Icons.circle_outlined,
                  color: selectedAddress
                      ? dark
                          ? TColors.white
                          : TColors.black
                      : null,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtnItems),
              InkWell(
                onTap: onTapDelete,
                child: Icon(
                  Iconsax.trash,
                  color: dark ? TColors.light : TColors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
