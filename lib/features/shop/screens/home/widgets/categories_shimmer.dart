import 'package:mr_store_getx_firebase/common/shimmer/shimmer_effect.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoriesListShimmer extends StatelessWidget {
  const CategoriesListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: isRtl
            ? EdgeInsets.zero
            : const EdgeInsets.only(left: TSizes.defaultSpace),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: isRtl ? (index == 7 ? TSizes.defaultSpace : 0) : 0,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerEffect(height: 56, width: 56, radius: 100),
                SizedBox(height: TSizes.spaceBtnItems / 2),
                ShimmerEffect(height: 8, width: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
