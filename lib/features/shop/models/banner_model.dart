import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String? id;
  String? search;
  String? image;
  String? dateReleased;
  bool? isFeatured;

  BannerModel({
    this.id,
    this.search,
    this.image,
    this.dateReleased,
    this.isFeatured,
  });

  BannerModel.empty()
      : id = '',
        search = '',
        image = '',
        dateReleased = '',
        isFeatured = false;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    search = json['search'];
    image = json['image'];
    dateReleased = json['dateReleased'];
    isFeatured = json['isFeatured'];
  }
  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      return BannerModel(
        id: data!['id'],
        search: data['search'],
        image: data['image'],
        dateReleased: data['dateReleased'],
        isFeatured: data['isFeatured'],
      );
    } else {
      return BannerModel.empty();
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['search'] = search;
    data['image'] = image;
    data['dateReleased'] = dateReleased;
    data['isFeatured'] = isFeatured;
    return data;
  }
}
