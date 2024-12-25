import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/popups/full_screen_loader.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/repositores/dummy_data_repository.dart';
import 'package:mr_store_getx_firebase/navigation_menu.dart';

class DummyDataController extends GetxController {
  static DummyDataController get instance => Get.find();
  final dummyDataRepository = Get.put(UploadDummyDataRepository());
  Future<void> uploadCategories() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'we are uploading your information',
        TImages.loader,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await dummyDataRepository.uploadDummyCategoriesData();

      TFullScreenLoader.stopLoading();
      TLoader.successStackBar(
        title: 'Congraduation',
        message: 'your data has been uploaded',
      );
      Get.off(()=> NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
