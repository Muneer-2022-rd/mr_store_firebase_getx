import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/promo_slider/banners_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/banner_model.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  Rx<int> currentIndex = 0.obs;
  updateIndex(newIndex) {
    currentIndex.value = newIndex;
  }

  final bannersRepository = Get.put(BannersRepository());
  final Rx<bool> isLoading = false.obs;
  final RxList<BannerModel> allBanners = <BannerModel>[].obs;
  final RxList<BannerModel> featuredBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllBanners();
  }

  fetchAllBanners() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final banners = await bannersRepository.getBanners();
      allBanners.assignAll(banners);
      featuredBanners.assignAll(
          banners.where((category) => category.isFeatured!).take(3).toList());
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
