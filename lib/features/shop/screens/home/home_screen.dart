import 'package:mr_store_getx_firebase/common/widgets/custom_grid_layout.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/extensions/widget_list_spacing.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/home_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/home_categories.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/primary_right_header_container.dart';
import 'package:mr_store_getx_firebase/common/widgets/search_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_card_vertical.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryRightHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SearchContainer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                    child: SeactionHeading(
                      showActionButton: true,
                      title: TTexts.homePopularCategoriesHeading,
                      textColor: TColors.white,
                      buttonTitle: TTexts.homeShowAllButton,
                    ),
                  ),
                  const HomeCategories(),
                ].withSpacing(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
                top: TSizes.defaultSpace / 2,
              ),
              child: Column(
                children: [
                  const HomePromoSlider(),
                  const SizedBox(height: TSizes.spaceBtnSections),
                  SeactionHeading(
                    showActionButton: true,
                    title: TTexts.homePopularProductsHeading,
                    buttonTitle: TTexts.homeShowAllButton,
                    onPressed: () {
                      Get.toNamed(AppRoute.allProducts);
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtnItems),
                  CustomGridLayout(
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
