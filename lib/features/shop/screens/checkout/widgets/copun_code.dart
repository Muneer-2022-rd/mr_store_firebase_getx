import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CopunCode extends StatelessWidget {
  const CopunCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController promoCodeC = TextEditingController();
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.xs,
        bottom: TSizes.xs,
        right: TSizes.xs,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: promoCodeC,
              decoration: InputDecoration(
                hintText: TTexts.checkoutCoupon,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.grey.withValues(alpha: 0.2),
              side: BorderSide(
                color: dark
                    ? TColors.white.withValues(alpha: 0.5)
                    : TColors.dark.withValues(alpha: 0.5),
              ),
              foregroundColor: dark
                  ? TColors.white.withValues(alpha: 0.5)
                  : TColors.dark.withValues(alpha: 0.5),
            ),
            child: Text(TTexts.apply,
                style: Theme.of(context).textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}
