import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  Rx<bool> obscureText = true.obs;
  Rx<bool> rememberMe = true.obs;
  final localeStorage = GetStorage();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    email.text = localeStorage.read('REMEMBER_ME_EMAIL');
    password.text = localeStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  @override
  void onClose() {
    email.clear();
    password.clear();
    super.onClose();
  }

  showHidePassword() {
    obscureText.value = !obscureText.value;
  }

  rememberMeCheckbox(bool? newRememberMe) {
    rememberMe.value = newRememberMe!;
  }

  emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Logging you in ..',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!signinFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localeStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localeStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Logging you in ..',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.loginWithGoogle();
      userController.saveUserRecord(userCredentials);
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
