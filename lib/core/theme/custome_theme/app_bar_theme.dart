import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: TColors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: TColors.black, size: 24),
    titleTextStyle: TextStyle(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.black,
    ),
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: TColors.white, size: 24),
    actionsIconTheme: const IconThemeData(color: TColors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.white,
    ),
  );
}
