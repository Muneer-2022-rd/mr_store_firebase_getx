import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/exceptions/firebase_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/format_exception.dart';
import 'package:mr_store_getx_firebase/core/exceptions/platform_exception.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord({required UserModel user}) async {
    try {
      await _db.collection(TCollections.users).doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection(TCollections.users)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection(TCollections.users)
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection(TCollections.users)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

    Future<void> removeUserRecord(String userId) async {
    try {
      await _db
          .collection(TCollections.users)
          .doc(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(code: e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(code: e.toString());
    } on PlatformException catch (e) {
      throw TPlatformException(code: e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
