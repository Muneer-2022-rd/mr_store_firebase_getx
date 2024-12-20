import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SeactionHeading(
          title: TTexts.method,
          buttonTitle: TTexts.change,
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.all(TSizes.sm),
                        child: Row(
                          children: [
                            RoundedContainer(
                              width: 40.w,
                              height: 40.h,
                              backgroundColor:
                                  dark ? TColors.darkerGrey : TColors.white,
                              padding: const EdgeInsets.all(TSizes.sm),
                              child: Image(
                                image: AssetImage(TImages.paymentPaypal),
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: TSizes.spaceBtnItems / 2),
                            Text("Paypal",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtnItems),
                      RoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.all(TSizes.sm),
                        child: Row(
                          children: [
                            RoundedContainer(
                              width: 40.w,
                              height: 40.h,
                              backgroundColor:
                                  dark ? TColors.darkerGrey : TColors.white,
                              padding: const EdgeInsets.all(TSizes.sm),
                              child: Image(
                                image: AssetImage(TImages.paymentStripe),
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: TSizes.spaceBtnItems / 2),
                            Text("Stripe",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
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
        const SizedBox(height: TSizes.spaceBtnItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 40.w,
              height: 40.h,
              backgroundColor: dark ? TColors.darkerGrey : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: Image(
                image: AssetImage(TImages.paymentPaypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtnItems / 2),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
