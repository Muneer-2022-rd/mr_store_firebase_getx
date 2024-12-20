import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/app_bar_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/bottom_sheet_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/check_box_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/chip_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/elevated_button_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/navigation_bar_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/outlined_button_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/text_field_theme.dart';
import 'package:mr_store_getx_firebase/core/theme/custome_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: Get.locale?.languageCode == 'en' ? 'Poppins' : 'Fustat',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonThemeData.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TButtomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
    chipTheme: TChipTheme.lightChipTheme,
    dividerTheme: const DividerThemeData(color: TColors.black, thickness: 0.5),
    navigationBarTheme: TNavigationBarTheme.lightNavigationBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: Get.locale?.languageCode == 'en' ? 'Poppins' : 'Fustat',
    brightness: Brightness.dark,
    primaryColor: TColors.primaryDark,
    scaffoldBackgroundColor: TColors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonThemeData.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TButtomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
    chipTheme: TChipTheme.darkChipTheme,
    dividerTheme: const DividerThemeData(color: TColors.white, thickness: 0.5),
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarTheme,
  );
}
