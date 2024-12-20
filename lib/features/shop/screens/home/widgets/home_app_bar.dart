import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/cart_counter_icon.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppBarTitle,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: TColors.white),
          ),
          Text(
            'Muneer Radwan',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: TColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          iconColor: TColors.white,
          numberColor: TColors.white,
          backgroundNumberColor: TColors.black,
        )
      ],
    );
  }
}
