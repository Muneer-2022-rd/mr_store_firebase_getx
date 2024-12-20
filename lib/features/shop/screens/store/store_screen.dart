import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_tab_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/cart_counter_icon.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/common/widgets/search_container.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/category_tab.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/store/widgets/store_featured_brand_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Get.toNamed(AppRoute.cart);
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
                expandedHeight: 380.h,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtnItems.h),
                      const SearchContainer(
                        showBoarder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtnSections.h),
                      SeactionHeading(
                        showActionButton: true,
                        title: TTexts.storeFeaturedBrandsTitle,
                        buttonTitle: TTexts.homeShowAllButton,
                        onPressed: () {
                          Get.toNamed(AppRoute.allBrands);
                        },
                      ),
                      SizedBox(height: TSizes.spaceBtnItems.h / 1.5),
                      const StoreFeaturedBrandsList(),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: [
                    Tab(child: Text(TTexts.storeSports)),
                    Tab(child: Text(TTexts.storeCloths)),
                    Tab(child: Text(TTexts.storeCosmotics)),
                    Tab(child: Text(TTexts.storeElectronics)),
                    Tab(child: Text(TTexts.storeFurnitures)),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
