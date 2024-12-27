import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/enum.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/models/brand_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/brand_tile_with_verified_icon.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final void Function()? onTap;
  final bool showBorder;
  final BrandModel brand;
  const BrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                fit: BoxFit.contain,
                url: brand.image!,
                isNetworkImage: true,
                backroundColor: Colors.transparent,
                
              ),
            ),
            SizedBox(width: TSizes.spaceBtnItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTileWithVerifiedIcon(
                    title: brand.name!,
                    barndTextSizes: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount} ${TTexts.products}',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
