import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final PageController pageController = PageController();
  final storage = GetStorage();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
    print("Current Page Index Updated: $index");
  }

  void dotNavigationClick(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      storage.writeIfNull('IsFirstTime', false);
      Get.offAllNamed(AppRoute.login);
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
    storage.writeIfNull('IsFirstTime', false);
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
