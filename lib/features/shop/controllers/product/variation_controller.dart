import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/product/images_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();
  RxMap selectedAttributes = {}.obs;
  RxString variationStockState = ''.obs;
  Rx<ProductVariationsModel> selectedVariation =
      ProductVariationsModel.empty().obs;
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationsModel.empty());
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockState();
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttribuetsAvailabillityInVariation(
      List<ProductVariationsModel> variations, String attribuetName) {
    final availableVariationAttribuetsValues = variations
        .where((variation) =>
            variation.attributeValues[attribuetName] != null &&
            variation.attributeValues[attribuetName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attribuetName])
        .toSet();
    return availableVariationAttribuetsValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  void getProductVariationStockState() {
    variationStockState.value =
        selectedVariation.value.stock > 0 ? TTexts.inStock : TTexts.outStock;
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockState.value = '';
    selectedVariation.value = ProductVariationsModel.empty();
  }
}
