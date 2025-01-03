import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  Rx<String> selectedProductImage = ''.obs;
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedProductImage.value = product.thumbnail;
    if (product.images != null) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    print(images.map((image) => print(image)));
    return images.toList();
  }
}
