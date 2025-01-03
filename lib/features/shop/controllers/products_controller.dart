import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/controllers/network_manager.dart';
import 'package:mr_store_getx_firebase/core/popups/loader.dart';
import 'package:mr_store_getx_firebase/data/repositories/product/products_repository.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  final productsRepository = Get.put(ProductsRepository());
  final Rx<bool> isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final RxList<ProductModel> productsByCategory = <ProductModel>[].obs;
  final RxList<ProductModel> productsByBrand = <ProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final products = await productsRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  fetchProductsByCategory(String categoryId) async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final products =
          await productsRepository.getProductsByCategory(categoryId);
      productsByCategory.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }


  fetchProductsByBrand(String brandId) async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }
      final products = await productsRepository.getProductsByBrand(brandId);
      productsByBrand.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      TLoader.errorStackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

}
