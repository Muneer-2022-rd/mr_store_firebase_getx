import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/data/repositories/user/user_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  Rx<bool> obscureText = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  void fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        print("google sign in 1");
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUserName(userCredential.user!.displayName ?? '');
        final user = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          userName: username,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
        await userRepository.saveUserRecord(user: user);
      }
    } catch (e) {
      TLoader.warningStackBar(title: 'Data not saved!', message: e.toString());
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.error,
          side: BorderSide(
            color: TColors.error,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Cancel'),
        ),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Proccessing', TImages.loader);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.loginWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(AppRoute.login);
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.offAll(AppRoute.login);
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Proccessing',
        TImages.loader,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAllNamed(AppRoute.login);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  showHidePassword() {
    obscureText.value = !obscureText.value;
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImageFile(
            '${TCollections.users}/Images/Profile/', image);
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoader.successStackBar(
            title: 'Congraduation',
            message: 'your profile image has been updated!');
      }
    } catch (e) {
      TLoader.warningStackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
