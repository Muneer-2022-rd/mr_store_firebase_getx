import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.black,
      side: const BorderSide(color: TColors.grey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      textStyle: TextStyle(
        fontSize: TSizes.fontSizeMd,
        color: TColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: TSizes.md, horizontal: 20),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      side: const BorderSide(color: TColors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      textStyle: TextStyle(
        fontSize: TSizes.fontSizeMd,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: TSizes.md, horizontal: 20),
    ),
  );
}
