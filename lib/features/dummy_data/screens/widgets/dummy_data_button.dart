import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';

class UploadDummyDataButton extends StatelessWidget {
  final String buttonTitle;
  final IconData buttonPrefixIcon;
  final VoidCallback onTap;
  const UploadDummyDataButton({
    super.key,
    required this.buttonTitle,
    required this.buttonPrefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      child: Padding(
        padding: EdgeInsets.all(TSizes.md),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(buttonPrefixIcon),
              Text('Upload $buttonTitle',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.normal)),
              Icon(Iconsax.arrow_circle_up),
            ],
          ),
        ),
      ),
    );
  }
}