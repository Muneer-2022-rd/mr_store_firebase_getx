import 'package:mr_store_getx_firebase/features/shop/models/brand_model.dart';

class BrandsDummyData {
  static final List<BrandModel> brands = [
    BrandModel(
      id: '100',
      image: 'assets/images/brands/nike.png',
      name: 'Nike',
      isFeatured: true,
      productsCount: 30,
    ),
    BrandModel(
      id: '200',
      image: 'assets/images/brands/adidas.png',
      name: 'Adidas',
      isFeatured: true,
      productsCount: 43,
    ),
    BrandModel(
      id: '300',
      image: 'assets/images/brands/puma.png',
      name: 'Puma',
      isFeatured: true,
      productsCount: 20,
    ),
  ];
}
