import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/categories/categories_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final categoriesRepository = Get.put(CategoriesRepository());
  final Rx<bool> isLoading = false.obs;
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

    @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }

  fetchAllCategories() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final categories = await categoriesRepository.getAllcategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(categories
          .where(
              (category) => category.isFeatured! && category.parentId!.isEmpty)
          .take(8)
          .toList());
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {}
  }
}
