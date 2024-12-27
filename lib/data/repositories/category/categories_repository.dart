import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';

class CategoriesRepository extends GetxController {
  static CategoriesRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final categoriesSnapshot = await _db
          .collection(TCollections.categories)
          .where('parentId', isEqualTo: categoryId)
          .get();
      final categoriesList = categoriesSnapshot.docs
          .map((categoriesDocument) =>
              CategoryModel.fromSnapshot(categoriesDocument))
          .toList();
      return categoriesList;
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

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final categoriesSnapshot =
          await _db.collection(TCollections.categories).get();
      final categoriesList = categoriesSnapshot.docs
          .map((categoriesDocument) =>
              CategoryModel.fromSnapshot(categoriesDocument))
          .toList();
      return categoriesList;
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
