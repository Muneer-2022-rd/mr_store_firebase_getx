import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TTextFieldTheme {
  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.grey,
    suffixIconColor: TColors.grey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.black12, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.orange, width: 2.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    hintStyle: TextStyle(
      color: TColors.black,
      fontSize: TSizes.fontSizeSm,
    ),
    errorStyle: const TextStyle(
      fontWeight: FontWeight.normal,
    ),
    labelStyle: TextStyle(
      color: TColors.black,
      fontSize: TSizes.fontSizeSm,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.black.withValues(alpha: 0.8),
    ),
  );
  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.grey,
    suffixIconColor: TColors.grey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.white, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: BorderSide(color: TColors.primaryDark, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.orange, width: 2.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: TColors.grey, width: 1.0),
    ),
    hintStyle: TextStyle(
      color: TColors.white,
      fontSize: TSizes.fontSizeSm,
    ),
    errorStyle: const TextStyle(
      fontWeight: FontWeight.normal,
    ),
    labelStyle: TextStyle(
      color: TColors.white,
      fontSize: TSizes.fontSizeSm,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.white.withValues(alpha: 0.8),
    ),
  );
}
