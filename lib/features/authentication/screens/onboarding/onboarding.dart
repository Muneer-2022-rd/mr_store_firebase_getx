import 'package:mr_store_getx_firebase/features/authentication/controllers/onboarding_controller.dart';
import 'package:mr_store_getx_firebase/features/authentication/models/onboarding_model.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    List<OnBoardingModel> pagesList = [
      OnBoardingModel(
          title: TTexts.onBoardingTitle1,
          subTitle: TTexts.onBoardingSubtitle1,
          image: TImages.onBoardingImageOne),
      OnBoardingModel(
          title: TTexts.onBoardingTitle2,
          subTitle: TTexts.onBoardingSubtitle2,
          image: TImages.onBoardingImageTwo),
      OnBoardingModel(
          title: TTexts.onBoardingTitle3,
          subTitle: TTexts.onBoardingSubtitle3,
          image: TImages.onBoardingImageThree),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            itemCount: pagesList.length,
            itemBuilder: (context, index) => OnBoardingPage(
              title: pagesList[index].title,
              subTitle: pagesList[index].subTitle,
              image: pagesList[index].image,
            ),
          ),
          // const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNext()
        ],
      ),
    );
  }
}
