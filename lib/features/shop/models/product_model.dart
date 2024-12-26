import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final DateTime? date;
  final double salePrice;
  String thumbnail;
  final bool? isFeatured;
  final String? categoryId;
  final String? brandId;
  final String? description;
   List<String>? images;
  final String productType;
  final List<ProductAttributeModel>? productAttribute;
  final List<ProductVariationModel>? productVariation;
  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.sku,
    this.brandId,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    required this.productType,
    this.productAttribute,
    this.productVariation,
  });
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumbnail: '',
        productType: '',
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'title': title,
      'date': date?.millisecondsSinceEpoch,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
      'brandId': brandId,
      'description': description,
      'images': images ?? [],
      'productType': productType,
      'productAttribute': productAttribute != null
          ? productAttribute!.map((x) => x.toJson()).toList()
          : [],
      'productVariation': productVariation != null
          ? productVariation!.map((x) => x.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['sku'],
      title: data['title'],
      stock: data['stock'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      categoryId: data['categoryId'] ?? '',
      description: data['description'] ?? '',
      productType: data['productType'] ?? '',
      brandId: data['brandId'] ?? '',
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      productAttribute: (data['productAttribute'] as List<dynamic>)
          .map((productAttribute) =>
              ProductAttributeModel.fromJson(productAttribute))
          .toList(),
      productVariation: (data['productVariation'] as List<dynamic>)
          .map((productVariation) =>
              ProductVariationModel.fromJson(productVariation))
          .toList(),
    );
  }
}

class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['id'] ?? '',
      price: double.parse((data['price'] ?? 0.0).toString()),
      sku: data['sku'] ?? '',
      stock: data['stock'] ?? 0,
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      image: data['image'] ?? "",
      attributeValues: Map<String, String>.from(data['attributeValues']),
    );
  }
}

class ProductAttributeModel {
  final String? name;
  final List<String>? values;
  ProductAttributeModel({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('name') ? data['name'] : '',
      values: List<String>.from(data['values']),
    );
  }
}
