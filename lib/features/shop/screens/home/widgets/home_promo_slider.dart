import 'package:carousel_slider/carousel_slider.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/banners_controller.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannersController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: controller.featuredBanners
              .map(
                (banner) => RoundedImage(
                    width: double.infinity,
                    url: banner.image!,
                    applyRadius: true,
                    fit: BoxFit.cover),
              )
              .toList(),
          options: CarouselOptions(
            autoPlayCurve: Curves.bounceInOut,
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: true,
            pageSnapping: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) => controller.updateIndex(index),
          ),
          carouselController: CarouselSliderController(),
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.featuredBanners.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.currentIndex.value == i
                      ? TColors.getPrimaryColor(context)
                      : TColors.grey,
                )
            ],
          ),
        ),
      ],
    );
  }
}
