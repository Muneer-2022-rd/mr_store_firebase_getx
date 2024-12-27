import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';

class ProductsRepository extends GetxController {
  static ProductsRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final productsSnapshot = await _db
          .collection(TCollections.products)
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final productsList = productsSnapshot.docs
          .map(
              (productsDocument) => ProductModel.fromSnapshot(productsDocument))
          .toList();
      return productsList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
  Future<List<ProductModel>> getProductsByBrand(String brandId) async {
    try {
      final productsSnapshot = await _db
          .collection(TCollections.products)
          .where('brand.id', isEqualTo: brandId)
          .get();
      final productsList = productsSnapshot.docs
          .map(
              (productsDocument) => ProductModel.fromSnapshot(productsDocument))
          .toList();
      return productsList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    try {
      final productsSnapshot = await _db
          .collection(TCollections.products)
          .where('categoryId', isEqualTo: categoryId)
          .get();
      final productsList = productsSnapshot.docs
          .map(
              (productsDocument) => ProductModel.fromSnapshot(productsDocument))
          .toList();
      return productsList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
