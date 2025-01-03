import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXxl,
      fontWeight: FontWeight.bold,
      color: TColors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXl,
      fontWeight: FontWeight.w600,
      color: TColors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: TColors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w500,
      color: TColors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w400,
      color: TColors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.normal,
      color: TColors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.black.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.black.withValues(alpha: 0.5),
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.black.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXxl,
      fontWeight: FontWeight.bold,
      color: TColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXl,
      fontWeight: FontWeight.w600,
      color: TColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: TColors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w500,
      color: TColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w400,
      color: TColors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.normal,
      color: TColors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TColors.white.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.white.withValues(alpha: 0.5),
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: TColors.white.withValues(alpha: 0.5),
    ),
  );
}
