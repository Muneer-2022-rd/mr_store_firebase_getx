import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mr_store_getx_firebase/core/formatters/formatter.dart';

class UserModel {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  String? gender;
  String? birthDate;
  String? lastActive;
  String? about;
  bool? isOnline;
  String? pushToken;

  UserModel({
    this.id,
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.profilePicture,
    this.gender,
    this.birthDate,
    this.lastActive,
    this.about,
    this.isOnline,
    this.pushToken,
  });

  static UserModel empty() => UserModel(
        id: '',
        email: '',
        userName: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        profilePicture: '',
        gender: '',
        birthDate: '',
        lastActive: '',
        about: '',
        isOnline: false,
        pushToken: '',
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'gender': gender,
      'birthDate': birthDate,
      'lastActive': lastActive,
      'about': about,
      'isOnline': isOnline,
      'pushToken': pushToken,
    };
  }

  String get fullName => "$firstName $lastName";
  String get formattedPhoneNu => TFormatter.formatPhoneNumber(phoneNumber!);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "mr_$camelCaseUserName";
    return userNameWithPrefix;
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data();
      return UserModel(
        id: data?['id'] ?? "",
        userName: data?['userName'] ?? "",
        firstName: data?['firstName'] ?? "",
        lastName: data?['lastName'] ?? "",
        email: data?['email'] ?? "",
        phoneNumber: data?['phoneNumber'] ?? "",
        profilePicture: data?['profilePicture'] ?? "",
        gender: data?['gender'] ?? "",
        birthDate: data?['birthDate'] ?? "",
        lastActive: data?['lastActive'] ?? "",
        about: data?['about'] ?? "",
        isOnline: data?['isOnline'] ?? false,
        pushToken: data?['pushToken'] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }
  UserModel.fromJson(Map<String, dynamic> json) {
    lastActive = json['lastActive'];
    phoneNumber = json['phoneNumber'];
    about = json['about'];
    isOnline = json['isOnline'];
    userName = json['userName'];
    pushToken = json['pushToken'];
    id = json['id'];
    firstName = json['firstName'];
    profilePicture = json['profilePicture'];
    email = json['email'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    lastName = json['lastName'];
  }
}
