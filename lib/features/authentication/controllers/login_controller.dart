import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  Rx<bool> obscureText = true.obs;
  Rx<bool> rememberMe = true.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  showHidePassword() {
    obscureText.value = !obscureText.value;
  }

  rememberMeCheckbox(bool? newRememberMe) {
    rememberMe.value = newRememberMe!;
  }
  
}
