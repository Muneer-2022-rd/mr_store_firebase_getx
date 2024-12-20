import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonThemeData {
  TElevatedButtonThemeData._();
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      backgroundColor: TColors.primary,
      disabledBackgroundColor: TColors.grey,
      disabledForegroundColor: TColors.grey,
      side: BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
      textStyle: TextStyle(
        fontSize: TSizes.fontSizeLg,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
        side: BorderSide(color: TColors.primary),
      ),
    ),
  );
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      backgroundColor: TColors.primaryDark,
      disabledBackgroundColor: TColors.grey,
      disabledForegroundColor: TColors.grey,
      side: BorderSide(color: TColors.primaryDark),
      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
      textStyle: TextStyle(
        fontSize: TSizes.fontSizeLg,
        color: TColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: TColors.primaryDark),
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
  );
}
