import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String? name;
  String? image;
  String? parentId;
  bool? isFeatured;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.isFeatured,
  });

  CategoryModel.empty()
      : id = '',
        name = '',
        image = '',
        parentId = '',
        isFeatured = false;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parentId'];
    isFeatured = json['isFeatured'];
  }
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      return CategoryModel(
        id: data!['id'],
        name: data['name'],
        image: data['image'],
        parentId: data['parentId'],
        isFeatured: data['isFeatured'],
      );
    } else {
      return CategoryModel.empty();
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['parentId'] = parentId;
    data['isFeatured'] = isFeatured;
    return data;
  }
}
