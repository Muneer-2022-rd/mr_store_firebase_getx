import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';

class CategoriesDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '100',
      image: 'assets/images/categories/clothes.png',
      name: 'Clothes',
      isFeatured: true,
      parentId: '',
    ),
    CategoryModel(
      id: '200',
      image: 'assets/images/categories/devices.png',
      name: 'Devices',
      isFeatured: true,
      parentId: '',
    ),
    CategoryModel(
      id: '201',
      image: 'assets/images/categories/sub_categories/laptops.png',
      name: 'Laptops',
      isFeatured: false,
      parentId: '200',
    ),
    CategoryModel(
      id: '202',
      image: 'assets/images/categories/sub_categories/phones.png',
      name: 'Phones',
      isFeatured: false,
      parentId: '200',
    ),
    CategoryModel(
      id: '203',
      image: 'assets/images/categories/sub_categories/watches.png',
      name: 'Watches',
      isFeatured: false,
      parentId: '200',
    ),
    CategoryModel(
      id: '204',
      image: 'assets/images/categories/sub_categories/desktops.png',
      name: 'Desktops',
      isFeatured: false,
      parentId: '200',
    ),
    CategoryModel(
      id: '101',
      image: 'assets/images/categories/sub_categories/babies.png',
      name: 'Babies',
      isFeatured: false,
      parentId: '100',
    ),
    CategoryModel(
      id: '102',
      image: 'assets/images/categories/sub_categories/kids.png',
      name: 'Kids',
      isFeatured: false,
      parentId: '100',
    ),
    CategoryModel(
      id: '103',
      image: 'assets/images/categories/sub_categories/men.png',
      name: 'Men',
      isFeatured: false,
      parentId: '100',
    ),
    CategoryModel(
      id: '104',
      image: 'assets/images/categories/sub_categories/women.png',
      name: 'Women',
      isFeatured: false,
      parentId: '100',
    ),
  ];
}
