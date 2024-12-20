import 'package:mr_store_getx_firebase/common/widgets/circular_icon.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/curved_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    final List<String> imagesList = [
      TImages.productPink,
      TImages.productBlue,
      TImages.productGreen,
      TImages.productOrange,
      TImages.productYellow,
      TImages.productPurple,
    ];
    return CurvedEdgesWidget(
      child: Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: dark ? TColors.darkerGrey : TColors.light,
            child: Image(
              image: AssetImage(TImages.productThmbnail),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 30,
            left: TSizes.defaultSpace / 2,
            right: TSizes.defaultSpace / 2,
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: RoundedImage(
                    applyRadius: true,
                    url: imagesList[index],
                    width: 90,
                    border: Border.all(color: TColors.getPrimaryColor(context)),
                    backgroundColor: dark ? TColors.darkerGrey : TColors.light,
                    fit: BoxFit.contain,
                  ),
                ),
                itemCount: imagesList.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          CustomAppBar(
            leadingIcon: CircularIcon(
              icon: textDirection == TextDirection.rtl
                  ? Iconsax.arrow_right_3
                  : Iconsax.arrow_left_2,
              color: dark ? TColors.white : TColors.black,
            ),
            leadingOnPressed: () => Get.back(),
            actions: const [
              CircularIcon(
                icon: Iconsax.heart5,
                color: TColors.error,
              ),
            ],
          )
        ],
      ),
    );
  }
}
