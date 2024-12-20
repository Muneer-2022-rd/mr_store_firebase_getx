import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(index) => currentPageIndex.value = index;
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.toNamed(AppRoute.login);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipPage() {
    Get.toNamed(AppRoute.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
