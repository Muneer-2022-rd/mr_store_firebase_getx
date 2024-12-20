import 'package:mr_store_getx_firebase/features/shop/screens/home/home_screen.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/settings/settings.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/wishlist/wishlist_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    List<Widget> pagesList = [
      const HomeScreen(),
      const StoreScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          destinations: [
            NavigationDestination(
              tooltip: 'home',
              icon: const Icon(Iconsax.home),
              label: TTexts.home,
            ),
            NavigationDestination(
              tooltip: 'shop',
              icon: const Icon(Iconsax.shop),
              label: TTexts.store,
            ),
            NavigationDestination(
              tooltip: 'setting',
              icon: const Icon(Iconsax.setting),
              label: TTexts.wishlist,
            ),
            NavigationDestination(
              tooltip: 'profile',
              icon: const Icon(Iconsax.user),
              label: TTexts.profile,
            ),
          ],
          selectedIndex: controller.currentScreen.value,
          onDestinationSelected: controller.changeScreen,
        ),
      ),
      body: Obx(() => pagesList[controller.currentScreen.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  Rx<int> currentScreen = 0.obs;
  changeScreen(int newIndex) {
    currentScreen.value = newIndex;
  }
}
