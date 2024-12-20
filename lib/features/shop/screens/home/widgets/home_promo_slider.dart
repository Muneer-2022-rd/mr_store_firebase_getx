import 'package:carousel_slider/carousel_slider.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/home_controller.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/rounded_image.dart';

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      TImages.promoOne,
      TImages.promoTwo,
      TImages.promoThree
    ];
    final controller = HomeController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: banners
              .map(
                (image) => RoundedImage(
                    width: double.infinity,
                    url: image,
                    applyRadius: true,
                    fit: BoxFit.cover),
              )
              .toList(),
          options: CarouselOptions(
            autoPlayCurve: Curves.bounceInOut,
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: true,
            // enlargeCenterPage: true,
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
              for (int i = 0; i < 3; i++)
                CircularContainer(
                  width: 20.w,
                  height: 4.h,
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
