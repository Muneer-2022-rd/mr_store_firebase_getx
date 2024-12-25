import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/models/categories_dummy_model.dart';

class UploadDummyDataRepository extends GetxController {
  static UploadDummyDataRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  Future<void> uploadDummyCategoriesData() async {
    final categories = CategoriesDummyData.categories;
    try {
      for (var category in categories) {
        final imageFile = await getImageDataFromAssets(category.image!);
        final imageUrl = await uploadImageUint8ListData(
          "${TCollections.categories}/images/",
          imageFile,
          category.image!.split('/').last,
        );
        category.image = imageUrl;
        await _db
            .collection(TCollections.categories)
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      return imageData;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImageUint8ListData(
    String path,
    Uint8List image,
    String name,
  ) async {
    try {
      final ref = _storage.ref(path).child(name);
      await ref.putData(image);
      final url = ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImageFileData(
    String path,
    File image,
    String name,
  ) async {
    try {
      final ref = _storage.ref(path).child(name);
      await ref.putFile(image);
      final url = ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }
}
