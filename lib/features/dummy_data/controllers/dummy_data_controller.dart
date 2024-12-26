import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/repositores/dummy_data_repository.dart';

class UploadDummyDataController extends GetxController {
  static UploadDummyDataController get instance => Get.find();
  final Rx<bool> isLoading = false.obs;
  final uploadDummyDataRepository = Get.put(UploadDummyDataRepository());
  uploadCategoriesDummyData() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      await uploadDummyDataRepository.uploadDummyCategoriesData();
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

    uploadBrandsDummyData() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      await uploadDummyDataRepository.uploadDummyBrandsData();
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  uploadBannersDummyData() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      await uploadDummyDataRepository.uploadDummyBannersData();
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  uploadProductsDummyData() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      await uploadDummyDataRepository.uploadDummyProductsData();
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
