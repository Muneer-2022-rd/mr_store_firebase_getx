import 'package:mr_store_getx_firebase/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/device/utility.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    final textDirection = Directionality.of(context);
    return Positioned(
      bottom: TDeviceUtility.getBottomNavigationHeight() + 25,
      left: textDirection == TextDirection.ltr ? TSizes.defaultSpace : null,
      right: textDirection == TextDirection.rtl ? TSizes.defaultSpace : null,
      child: SmoothPageIndicator(
        controller: controller.pageController, // Ensure this is consistent
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor:
              dark ? TColors.light : TColors.getPrimaryColor(context),
          dotHeight: 6,
        ),
        onDotClicked: controller.dotNavigationClick,
      ),
    );
  }
}
