import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';

import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/user/user_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/profile.dart';

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final userName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeUsername();
  }

  Future<void> initializeUsername() async {
    userName.text = userController.user.value.userName!;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'we are updating your information',
        TImages.loader,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!updateNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (await userRepository.isFieldFound(
          TCollections.users, 'userName', userName.text.trim())) {
        TFullScreenLoader.stopLoading();
        TLoader.errorStackBar(
          title: 'Username Taken',
          message:
              'The username "${userName.text.trim()}" is already in use. Please choose a different one.',
        );
        return;
      } else {
        Map<String, dynamic> newUserName = {
          'userName': userName.text.trim(),
        };
        await userRepository.updateSingleField(newUserName);
        userController.user.value.userName = userName.text.trim();

        TFullScreenLoader.stopLoading();
        TLoader.successStackBar(
          title: 'Congraduation',
          message: 'your username has been updated',
        );
        Get.off(() => ProfileScreen());
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
