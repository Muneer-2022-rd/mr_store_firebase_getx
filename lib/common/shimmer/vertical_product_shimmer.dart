import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/common/shimmer/shimmer_effect.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';

class VerticalProductsListShimmer extends StatelessWidget {
  final int itemCount;
  const VerticalProductsListShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtnItems),
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtnItems / 2),
            ShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
