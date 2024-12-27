import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/category/categories_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class SubCategoriesController extends GetxController {
  static SubCategoriesController get instance => Get.find();

  final categoriesRepository = Get.put(CategoriesRepository());
  final Rx<bool> isLoading = false.obs;
  final RxList<CategoryModel> subCategories = <CategoryModel>[].obs;
  final RxList<ProductModel> productsBySubCategory = <ProductModel>[].obs;
  

  fetchSubCategories(String categoryId) async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final categories =
          await categoriesRepository.getSubCategories(categoryId);
      subCategories.assignAll(categories.toList());
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    }
  }
}
