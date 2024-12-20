import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final void Function()? onPressed;
  const CircularIcon({
    super.key,
    this.icon,
    this.color,
    this.onPressed,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (dark
                ? TColors.black.withValues(alpha: 0.9)
                : TColors.white.withValues(alpha: 0.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
