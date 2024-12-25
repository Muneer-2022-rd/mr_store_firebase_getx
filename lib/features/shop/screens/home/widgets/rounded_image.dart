import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.padding,
    this.applyRadius = false,
    this.borderRadius = 12,
    this.border,
    this.backgroundColor,
    this.networkUrl = false,
    required this.url,
    this.fit,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool applyRadius;
  final double borderRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final bool networkUrl;
  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: applyRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: applyRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: networkUrl
              ? CachedNetworkImage(
                  imageUrl: url,
                  fit: fit,
                  
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
                    highlightColor:
                        dark ? Colors.grey[700]! : Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              : Image.asset(url, fit: fit),
        ),
      ),
    );
  }
}
