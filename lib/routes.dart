import 'package:mr_store_getx_firebase/features/authentication/screens/login/forget_password_screen.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/login/login.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/login/reset_password_screen.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/onboarding/onboarding.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/register/register.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/address/add_new_address.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/address/addresses_screen.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/dummy_data/upload_dummy_data_screen.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_birthdate.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_gender.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_name.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_phone.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_username.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/brand/all_brands_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/brand/brand_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/order/orders_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product/all_products_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/cart/cart_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/checkout/checkout_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/home_screen.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/profile.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/settings/settings.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/store_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:mr_store_getx_firebase/navigation_menu.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const OnBoardingScreen()),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.register, page: () => const RegisterScreen()),
  GetPage(
      name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(name: AppRoute.navigationMenu, page: () => const NavigationMenu()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.store, page: () => const StoreScreen()),
  GetPage(name: AppRoute.settings, page: () => const SettingsScreen()),
  GetPage(name: AppRoute.profile, page: () => const ProfileScreen()),
  GetPage(name: AppRoute.changeName, page: () => const ChangeNameScreen()),
  GetPage(name: AppRoute.changeGender, page: () => const ChangeGenderScreen()),
  GetPage(
      name: AppRoute.changeBirthDate,
      page: () => const ChangeBirthDateScreen()),
  GetPage(
      name: AppRoute.changePhoneNumber, page: () => const ChangePhoneScreen()),
  GetPage(
      name: AppRoute.changeUsername, page: () => const ChangeUserNameScreen()),
  GetPage(
      name: AppRoute.productReviews, page: () => const ProductReviewsScreen()),
  GetPage(name: AppRoute.address, page: () => const UserAddressScreen()),
  GetPage(name: AppRoute.addAddress, page: () => const AddNewAddressScreen()),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  GetPage(name: AppRoute.checkout, page: () => const CheckoutScreen()),
  GetPage(name: AppRoute.wishlist, page: () => const FavoriteScreen()),
 
  GetPage(name: AppRoute.allProducts, page: () => const AllProductsScreen()),
  GetPage(name: AppRoute.allBrands, page: () => const AllBrandsScreen()),
  GetPage(
      name: AppRoute.brandProducts, page: () => const BrandProductsScreen()),
  GetPage(name: AppRoute.orders, page: () => const OrdersScreen()),
  GetPage(name: AppRoute.dummy, page: () => const UploadDummyDataScreen()),
];
