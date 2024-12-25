import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/data/repositories/user/user_repository.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/register/verify_email_screen.dart';
import 'package:mr_store_getx_firebase/features/personalization/models/user_model.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController userName;
  late TextEditingController phone;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Rx<bool> obscureText = true.obs;
  Rx<bool> privacyPolicy = true.obs;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.clear();
    password.clear();
    firstName.clear();
    lastName.clear();
    userName.clear();
    phone.clear();
    super.onClose();
  }

  showHidePassword() {
    obscureText.value = !obscureText.value;
  }

  privacyPolicyCheckbox(bool? newprivacyPolicy) {
    privacyPolicy.value = newprivacyPolicy!;
  }

  signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'We are proccessing your information',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        TLoader.warningStackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the privacy policy and terms of use',
        );
        TFullScreenLoader.stopLoading();
        return;
      }

      if (await UserRepository.instance
          .isFieldFound(TCollections.users, 'userName', userName.text.trim())) {
        TFullScreenLoader.stopLoading();
        TLoader.errorStackBar(
          title: 'Username Taken',
          message:
              'The username "${userName.text.trim()}" is already in use. Please choose a different one.',
        );
        return;
      } else {
        final userCredentials = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        final user = UserModel(
            id: userCredentials.user!.uid,
            email: email.text.trim(),
            userName: userName.text.trim(),
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            phoneNumber: phone.text.trim(),
            profilePicture: '');
        final userRepository = Get.put(UserRepository());

        await userRepository.saveUserRecord(user: user);
        TFullScreenLoader.stopLoading();
        TLoader.successStackBar(
          title: 'Congraduation',
          message: 'your account has been created!, Verify account to continue',
        );
        Get.to(VerifyEmailScreen(email: email.text.trim()));
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
