import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

extension WidgetListSpacingExtension on List<Widget> {
  List<Widget> withSpacing() {
    return [
      for (int i = 0; i < length; i++) ...[
        if (i == 0) const SizedBox(height: TSizes.spaceBtnItems),
        this[i],
        if (i < length - 1) const SizedBox(height: TSizes.spaceBtnItems),
        if (i == length - 1) const SizedBox(height: TSizes.spaceBtnSections),
      ]
    ];
  }
}
