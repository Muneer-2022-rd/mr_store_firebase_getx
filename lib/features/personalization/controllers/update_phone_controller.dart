import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/user/user_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';

class UpdatePhoneController extends GetxController {
  static UpdatePhoneController get instance => Get.find();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final phoneNumber = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    initializephone();
  }

  Future<void> initializephone() async {
    phoneNumber.text = userController.user.value.phoneNumber!;
  }

  Future<void> updatePhone() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information', TImages.loader);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> newphone = {
        'phoneNumber': phoneNumber.text.trim(),
      };
      await userRepository.updateSingleField(newphone);
      userController.user.value.phoneNumber = phoneNumber.text.trim();
      TFullScreenLoader.stopLoading();
      TLoader.successStackBar(
        title: 'Congraduation',
        message: 'your phone has been updated',
      );
      Get.offNamed(AppRoute.profile);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}