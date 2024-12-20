import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    this.iconData = Iconsax.search_normal,
    this.showBackground = true,
    this.showBoarder = true,
    this.onPressed,
    this.padding,
  });

  final IconData? iconData;
  final bool showBackground, showBoarder;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBoarder ? Border.all(color: TColors.grey) : null,
          ),
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 14, top: 14, right: 14),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: TTexts.search,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              suffixIcon: const Icon(Iconsax.search_normal),
            ),
          ),
        ),
      ),
    );
  }
}
