import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/categories_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/categories_shimmer.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/vertical_image_text.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/sub_categories_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final controller = Get.put(CategoriesController());
    return Obx(() {
    if (controller.isLoading.value) {
    return const CategoriesListShimmer();
    } else {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: controller.featuredCategories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: isRtl
            ? EdgeInsets.zero
            : const EdgeInsets.only(left: TSizes.defaultSpace),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: isRtl
                ? (index == controller.featuredCategories.length - 1
                    ? TSizes.defaultSpace
                    : 0)
                : 0,
          ),
          child: VerticalImageText(
            onTap: () => Get.to(SubCategoriesScreen()),
            imageTitle: controller.featuredCategories[index].name!,
            image: controller.featuredCategories[index].image!,
            textColor: TColors.white,
          ),
        ),
      ),
    );
    }
    });
  }
}
