import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/settings/widgets/primary_left_header_container.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/settings/widgets/setting_menu_tile.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/settings/widgets/user_profile_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? switchTurn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryLeftHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    title: Text(
                      TTexts.account,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const UserProfileTile(),
                  SizedBox(height: TSizes.spaceBtnSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SeactionHeading(
                      title: "${TTexts.settings} ${TTexts.account}"),
                  const SizedBox(height: TSizes.spaceBtnItems),
                  SettingMenuTile(
                    title: TTexts.wishlist,
                    subTitle: TTexts.wishlistSubtitle,
                    leadingIcon: Iconsax.heart,
                    onTap: () {
                      Get.toNamed(AppRoute.wishlist);
                    },
                  ),
                  SettingMenuTile(
                      title: TTexts.orders,
                      subTitle: TTexts.ordersSubtitle,
                      leadingIcon: Iconsax.box,
                      onTap: () {
                        Get.toNamed(AppRoute.orders);
                      }),
                  SettingMenuTile(
                      title: TTexts.addresses,
                      subTitle: TTexts.addressesSubtitle,
                      leadingIcon: Iconsax.location,
                      onTap: () {
                        Get.toNamed(AppRoute.address);
                      }),
                  SettingMenuTile(
                      title: TTexts.uploadDummyData,
                      subTitle: TTexts.uploadDummyDataSubtitle,
                      leadingIcon: Iconsax.document_upload,
                      onTap: () {}),
                  const SizedBox(height: TSizes.spaceBtnItems),
                  SeactionHeading(title: "${TTexts.settings} ${TTexts.app}"),
                  const SizedBox(height: TSizes.spaceBtnItems),
                  SettingMenuTile(
                    title: TTexts.language,
                    subTitle: TTexts.languageSubtitle,
                    leadingIcon: Iconsax.language_square,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(TSizes.defaultSpace),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(TTexts.languageSubtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!),
                                const SizedBox(height: TSizes.spaceBtnItems),
                                RoundedContainer(
                                  showBorder: true,
                                  padding: EdgeInsets.all(TSizes.sm),
                                  backgroundColor:
                                      THelperFunctions.isDarkMode(context)
                                          ? TColors.white
                                          : TColors.black,
                                  child: GestureDetector(
                                    child: Text(
                                      TTexts.arabic,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color:
                                                  THelperFunctions.isDarkMode(
                                                          context)
                                                      ? TColors.black
                                                      : TColors.white),
                                    ),
                                    onTap: () {
                                      Get.updateLocale(Locale('ar'));
                                    },
                                  ),
                                ),
                                const SizedBox(height: TSizes.spaceBtnItems),
                                RoundedContainer(
                                  showBorder: true,
                                  backgroundColor:
                                      THelperFunctions.isDarkMode(context)
                                          ? TColors.white
                                          : TColors.black,
                                  padding: EdgeInsets.all(TSizes.sm),
                                  child: GestureDetector(
                                    child: Text(
                                      TTexts.english,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color:
                                                  THelperFunctions.isDarkMode(
                                                          context)
                                                      ? TColors.black
                                                      : TColors.white),
                                    ),
                                    onTap: () {
                                      Get.updateLocale(Locale('en'));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    trailing: RoundedContainer(
                      width: 50,
                      height: 40,
                      backgroundColor: THelperFunctions.isDarkMode(context)
                          ? TColors.softGrey
                          : TColors.darkerGrey,
                      child: Center(
                        child: Text(
                          Get.locale!.languageCode == 'en' ? 'en' : 'ar',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: THelperFunctions.isDarkMode(context)
                                      ? TColors.black
                                      : TColors.white),
                        ),
                      ),
                    ),
                  ),
                  SettingMenuTile(
                    title: TTexts.theme,
                    subTitle: TTexts.themeSubtitle,
                    leadingIcon: Iconsax.edit,
                    trailing: RoundedContainer(
                      backgroundColor: THelperFunctions.isDarkMode(context)
                          ? TColors.softGrey
                          : TColors.darkerGrey,
                      width: 50,
                      height: 40,
                      child: Icon(
                        THelperFunctions.isDarkMode(context)
                            ? Iconsax.moon
                            : Iconsax.sun,
                        color: THelperFunctions.isDarkMode(context)
                            ? TColors.black
                            : TColors.white,
                      ),
                    ),
                    onTap: () {
                      THelperFunctions.isDarkMode(context)
                          ? Get.changeThemeMode(ThemeMode.light)
                          : Get.changeThemeMode(ThemeMode.dark);
                    },
                  ),

                  SettingMenuTile(
                    title: TTexts.notifications,
                    subTitle: TTexts.notificationsSubtitle,
                    leadingIcon: Iconsax.notification,
                    trailing: Switch(
                      value: switchTurn!,
                      onChanged: (value) {
                        setState(() {
                          switchTurn = value;
                        });
                      },
                      activeTrackColor:
                          Theme.of(context).primaryColor.withValues(alpha: 0.2),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  // Obx(
                  //   () => Container(
                  //     color: controller.primaryColor.value,
                  //     width: 100,
                  //     height: 100,
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
