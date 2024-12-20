import 'package:cached_network_image/cached_network_image.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.isNetworkImage = false,
    required this.url,
    this.width = 56,
    this.height = 56,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.backroundColor,
    this.fit = BoxFit.cover,
    this.overlayColor,
  });
  final bool? isNetworkImage;
  final String url;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backroundColor;
  final BoxFit? fit;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage!
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                fit: fit,
                imageUrl: url,
                // color: overlayColor!.withValues(alpha: 0.1),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            )
          : Image(
              fit: fit,
              image: AssetImage(url),
              color: overlayColor,
            ),
    );
  }
}
