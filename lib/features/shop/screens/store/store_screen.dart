import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_tab_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';

import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/categories_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/brand/all_brands_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/cart/cart_screen.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/cart_counter_icon.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/common/widgets/search_container.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/category_tab.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/store_featured_brand_list.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesController.instance.featuredCategories;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            TTexts.store,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {
                Get.to(() => CartScreen());
              },
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 380,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtnItems),
                      const SearchContainer(
                        showBoarder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtnSections),
                      SeactionHeading(
                        showActionButton: true,
                        title: TTexts.storeFeaturedBrandsTitle,
                        buttonTitle: TTexts.homeShowAllButton,
                        onPressed: () {
                          Get.to(() => AllBrandsScreen());
                        },
                      ),
                      SizedBox(height: TSizes.spaceBtnItems / 1.5),
                      const StoreFeaturedBrandsList(),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name!)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => CategoryTab()).toList(),
          ),
        ),
      ),
    );
  }
}
