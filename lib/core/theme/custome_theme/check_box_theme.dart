import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TCheckBoxTheme {
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.primary;
        } else {
          return Colors.transparent;
        }
      },
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.white;
        } else {
          return TColors.black;
        }
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.primaryDark;
        } else {
          return Colors.transparent;
        }
      },
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.white;
        } else {
          return TColors.black;
        }
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
