import 'package:mr_store_getx_firebase/features/authentication/controllers/onboarding_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/device/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNext extends StatelessWidget {
  const OnBoardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final textDirection = Directionality.of(context);
    return Positioned(
      bottom: TDeviceUtility.getBottomNavigationHeight(),
      left: textDirection == TextDirection.rtl ? TSizes.defaultSpace : null,
      right: textDirection == TextDirection.ltr ? TSizes.defaultSpace : null,
      child: ElevatedButton(
        onPressed: controller.nextPage,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: TColors.getPrimaryColor(context)),
          shape: const CircleBorder(),
        ),
        child: Obx(
          () => controller.currentPageIndex.value == 2
              ? Text(TTexts.onBoardingGo)
              : Icon(
                  textDirection == TextDirection.ltr
                      ? Iconsax.arrow_right_3
                      : Iconsax.arrow_left_2,
                  color: TColors.white,
                ),
        ),
      ),
    );
  }
}
