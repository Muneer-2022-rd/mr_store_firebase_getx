import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/brand/brands_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/brand_model.dart';

class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  final categoriesRepository = Get.put(BrandsRepository());
  final Rx<bool> isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllBrands();
  }

  fetchAllBrands() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final brands = await categoriesRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          brands.where((category) => category.isFeatured!).take(4).toList());
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
