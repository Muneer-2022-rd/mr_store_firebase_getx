import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  final String image, imageTitle;
  final void Function()? onTap;
  final Color? backgroundColor, textColor;
  final bool? isSvgImage;
  const VerticalImageText({
    super.key,
    required this.imageTitle,
    required this.image,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.isSvgImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtnItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: isSvgImage!
                      ? (dark ? TColors.light : TColors.dark)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtnItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                imageTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
