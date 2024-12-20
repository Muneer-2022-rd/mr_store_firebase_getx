import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';

class TColors {
  TColors._();
  // app colors
  static Color primary = Color(0xffFD2400);
  static Color secondry = Color(0xfffa7354);
  static Color third = Color(0xffFF8C66);
  static Color primaryDark = Color(0xffa5311d);
  static Color primarySecondry = Color(0xff8A2719);
  static Color primaryThird = Color(0xff6E1E13);

  static Color getPrimaryColor(BuildContext context) {
    if (THelperFunctions.isDarkMode(context)) {
      return TColors.primaryDark;
    } else {
      return TColors.primary;
    }
  }

  static Color getSecondryColor(BuildContext context) {
    if (THelperFunctions.isDarkMode(context)) {
      return TColors.primarySecondry;
    } else {
      return TColors.secondry;
    }
  }

  static Color getThirdColor(BuildContext context) {
    if (THelperFunctions.isDarkMode(context)) {
      return TColors.primaryThird;
    } else {
      return TColors.third;
    }
  }

  // update color
  static void updatePrimaryColor(Color newColor) {
    primary = newColor;
  }

  // graident
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffFD2400),
      Color(0xfffa7354),
      Color(0xffFF8C66),
    ],
  );
  // text colors
  static Color textPrimary = const Color(0xff333333);
  static Color textSecondry = const Color(0xff6c757d);
  static Color textWhite = TColors.white;
  // background colors
  static Color light = const Color(0xfff6f6f6);
  static Color dark = const Color(0xff272727);
  static Color primaryBackground = const Color(0xfff3f5ff);
  // background container colors
  static Color lightContainer = const Color(0xfff6f6f6);
  static Color darkContainer = TColors.white.withValues(alpha: 0.1);
  // Button Colors
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondry = Color(0xff6C757D);
  static const Color buttonDisable = Color(0xffC4C4C4);
  // Border Colors
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecondry = Color(0xffe6e6e6);
  // Error and Validation Colors
  static const Color error = Color.fromARGB(255, 252, 0, 0);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);
  // Neutral Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
