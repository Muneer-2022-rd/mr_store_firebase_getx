import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();
  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    height: 80.h,
    elevation: 1,
    overlayColor:
        WidgetStatePropertyAll(TColors.primary.withValues(alpha: 0.05)),
    indicatorColor: TColors.primary.withValues(alpha: 0.05),
    backgroundColor: TColors.primary.withValues(alpha: 0.05),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? IconThemeData(color: TColors.primary)
          : const IconThemeData(color: TColors.black),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? TextStyle(color: TColors.primary, fontSize: TSizes.fontSizeSm)
          : const TextStyle(color: TColors.black),
    ),
  );
  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    height: 80.h,
    elevation: 1,
    overlayColor:
        WidgetStatePropertyAll(TColors.primaryDark.withValues(alpha: 0.4)),
    indicatorColor: TColors.primaryDark.withValues(alpha: 0.4),
    backgroundColor: TColors.white.withValues(alpha: 0.2),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? IconThemeData(color: TColors.primaryDark)
          : const IconThemeData(color: TColors.white),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) => states.contains(WidgetState.selected)
          ? TextStyle(color: TColors.primaryDark)
          : TextStyle(color: TColors.white, fontSize: TSizes.fontSizeSm),
    ),
  );
}
