import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mr_store_getx_firebase/features/shop/models/brand_model.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final String? date;
  final double salePrice;
  String thumbnail;
  final bool? isFeatured;
  final String? categoryId;
  final BrandModel? brand;
  final String? description;
  List<String>? images;
  final String productType;
  final List<ProductAttributesModel>? productAttributes;
  final List<ProductVariationsModel>? productVariations;
  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    required this.productType,
    this.productAttributes,
    this.productVariations,
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
      'date': date,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
      'brand': brand!.toJson(),
      'description': description,
      'images': images ?? [],
      'productType': productType,
      'productAttributes': productAttributes != null
          ? productAttributes!.map((x) => x.toJson()).toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations!.map((x) => x.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
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
      brand: BrandModel.fromJson(data['brand']),
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((productAttributes) =>
              ProductAttributesModel.fromJson(productAttributes))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((productVariations) =>
              ProductVariationsModel.fromJson(productVariations))
          .toList(),
    );
  }
}

class ProductVariationsModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;
  ProductVariationsModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });
  static ProductVariationsModel empty() =>
      ProductVariationsModel(id: '', attributeValues: {});
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

  factory ProductVariationsModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationsModel.empty();
    return ProductVariationsModel(
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

class ProductAttributesModel {
  final String? name;
  final List<String>? values;
  ProductAttributesModel({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributesModel();
    return ProductAttributesModel(
      name: data.containsKey('name') ? data['name'] : '',
      values: List<String>.from(data['values']),
    );
  }
}
