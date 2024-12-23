import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/login/reset_password_screen.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  late TextEditingController email;
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    email.clear();
  }

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request ..',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetLink(email.text.trim());
      TFullScreenLoader.stopLoading();
      TLoader.successStackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password');
      Get.to(() => SuccessResetPasswordScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request ..',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetLink(email);
      TFullScreenLoader.stopLoading();
      TLoader.successStackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password');
      Get.to(() => SuccessResetPasswordScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}