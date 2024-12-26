import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String? id;
  String? name;
  String? image;
  int? productsCount;
  bool? isFeatured;

  BrandModel({
    this.id,
    this.name,
    this.image,
    this.productsCount,
    this.isFeatured,
  });

  BrandModel.empty()
      : id = '',
        name = '',
        image = '',
        productsCount = 0,
        isFeatured = false;

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    productsCount = json['productsCount'];
    isFeatured = json['isFeatured'];
  }
  factory BrandModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      return BrandModel(
        id: data!['id'],
        name: data['name'],
        image: data['image'],
        productsCount: data['productsCount'],
        isFeatured: data['isFeatured'],
      );
    } else {
      return BrandModel.empty();
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['productsCount'] = productsCount;
    data['isFeatured'] = isFeatured;
    return data;
  }
}