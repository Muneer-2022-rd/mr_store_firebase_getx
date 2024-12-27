import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/product/products_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class ProductsByCategoryController extends GetxController {
  static ProductsByCategoryController get instance => Get.find();

  final productsRepository = ProductsRepository.instance;
  final Rx<bool> isLoading = false.obs;
  final RxList<ProductModel> productsBySubCategory = <ProductModel>[].obs;

  fetchProductsBySubCategory(String categoryId) async {
    try {
      isLoading.value = true;
       productsBySubCategory.clear();
       print("Fetching products for categoryId: $categoryId"); // Log categoryId
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final products =
          await productsRepository.getProductsBySubCategory(categoryId);
          print("Products fetched: ${products.map((p) => p.title)}"); // Log product names
      productsBySubCategory.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
