import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.raduis = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = TColors.white,
  });
  final double? width;
  final double? height;
  final double raduis;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
