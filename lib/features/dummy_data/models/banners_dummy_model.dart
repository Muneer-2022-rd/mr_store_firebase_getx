import 'package:mr_store_getx_firebase/core/formatters/formatter.dart';
import 'package:mr_store_getx_firebase/features/shop/models/banner_model.dart';

class BannersDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
      id: '001',
      image: 'assets/images/banners/clothes.jpg',
      isActive: true,
      search: '/clothes',
      dateReleased: TFormatter.formatDate(DateTime.now()),
    ),
    BannerModel(
      id: '002',
      image: 'assets/images/banners/devices.jpg',
      isActive: true,
      search: '/devices',
      dateReleased: TFormatter.formatDate(DateTime.now()),
    ),
  ];
}
