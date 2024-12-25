import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/user/user_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/profile.dart';

class UpdateBirthDateController extends GetxController {
  static UpdateBirthDateController get instance => Get.find();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final birthDate = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    birthDate.text = userController.user.value.birthDate!;
  }

  Future<void> updateBirthDate() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information', TImages.loader);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> newBirthDate = {
        'birthDate': birthDate.text.trim(),
      };
      await userRepository.updateSingleField(newBirthDate);
      userController.user.value.birthDate = birthDate.text.trim();
      TFullScreenLoader.stopLoading();
      TLoader.successStackBar(
          title: 'Congraduation', message: 'your birthdate has been updated');
      Get.off(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
