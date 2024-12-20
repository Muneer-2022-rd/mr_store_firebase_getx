import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  Rx<int> currentIndex = 0.obs;
  updateIndex(newIndex) {
    currentIndex.value = newIndex;
  }
}
