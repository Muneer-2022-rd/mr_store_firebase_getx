import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    if (product.productType == ProductType.single.name) {
      return (product.salePrice > 0.0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculatesalePercentage(double originalPrice, double salePrice) {
    if (salePrice <= 0.0) return null;
    if (originalPrice <= 0.0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockState(int stock) {
    return stock > 0 ? TTexts.inStock : TTexts.outStock;
  }
}
