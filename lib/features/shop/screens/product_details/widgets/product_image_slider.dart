import 'package:cached_network_image/cached_network_image.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_icon.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/helpers/show_image.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/product/images_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/curved_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  final ProductModel product;
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final textDirection = Directionality.of(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CurvedEdgesWidget(
      child: Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: dark ? TColors.darkerGrey : TColors.light,
            child: Obx(() {
              final image = controller.selectedProductImage.value;
              return GestureDetector(
                onTap: () => showImageDialog(
                  context: context,
                  imageUrl: image,
                  isNetworkImage: true,
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              );
            }),
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
                  child: Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return RoundedImage(
                      applyRadius: true,
                      url: images[index],
                      width: 90,
                      border: imageSelected
                          ? Border.all(
                              color: TColors.getPrimaryColor(context),
                              width: 2,
                            )
                          : null,
                      backgroundColor:
                          dark ? TColors.darkerGrey : TColors.light,
                      fit: BoxFit.cover,
                      networkUrl: true,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
                itemCount: images.length,
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
