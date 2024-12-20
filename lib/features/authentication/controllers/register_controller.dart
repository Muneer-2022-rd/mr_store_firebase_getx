import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController firstController;
  late TextEditingController lastController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  Rx<bool> obscureText = true.obs;
  Rx<bool> agreeToPrivacyAndTerms = true.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstController = TextEditingController();
    lastController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    firstController.clear();
    lastController.clear();
    usernameController.clear();
    phoneController.clear();
    super.onClose();
  }

  showHidePassword() {
    obscureText.value = !obscureText.value;
  }

  agreeToPrivacyAndTermsCheckbox(bool? newAgreeToPrivacyAndTerms) {
    agreeToPrivacyAndTerms.value = newAgreeToPrivacyAndTerms!;
  }
}
