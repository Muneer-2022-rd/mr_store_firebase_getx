import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/features/shop/models/banner_model.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<BannerModel>> getBanners() async {
    try {
      final bannersSnapshot = await _db.collection(TCollections.banners).get();
      final bannersList = bannersSnapshot.docs
          .map((bannersDocument) => BannerModel.fromSnapshot(bannersDocument))
          .toList();
      return bannersList;
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
