import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 220,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
