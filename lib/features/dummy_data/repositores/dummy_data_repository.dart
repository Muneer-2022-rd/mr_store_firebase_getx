import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/models/banners_dummy_model.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/models/categories_dummy_model.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/models/products_dummy_model.dart';

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

  Future<void> uploadDummyBannersData() async {
    final banners = BannersDummyData.banners;
    try {
      for (var banner in banners) {
        final imageFile = await getImageDataFromAssets(banner.image!);
        final imageUrl = await uploadImageUint8ListData(
          "${TCollections.banners}/images/",
          imageFile,
          banner.image!.split('/').last,
        );
        banner.image = imageUrl;
        await _db
            .collection(TCollections.banners)
            .doc(banner.id)
            .set(banner.toJson());
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

  Future<void> uploadDummyProductsData() async {
    final products = ProductsDummyData.products;
    try {
      for (var product in products) {
        // Upload thumbnail
        if (product.thumbnail.isNotEmpty) {
          final imageFile = await getImageDataFromAssets(product.thumbnail);
          final imageUrl = await uploadImageUint8ListData(
            "${TCollections.products}/thumbnails/",
            imageFile,
            product.thumbnail.split('/').last,
          );
          product.thumbnail = imageUrl;
        }

        // Upload additional images
        if (product.images != null && product.images!.isNotEmpty) {
          final uploadedImages = <String>[];
          for (var imagePath in product.images!) {
            final additionalImageFile = await getImageDataFromAssets(imagePath);
            final additionalImageUrl = await uploadImageUint8ListData(
              "${TCollections.products}/images/",
              additionalImageFile,
              imagePath.split('/').last,
            );
            uploadedImages.add(additionalImageUrl);
          }
          product.images = uploadedImages;
        }

        await _db
            .collection(TCollections.products)
            .doc(product.id)
            .set(product.toJson());
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
