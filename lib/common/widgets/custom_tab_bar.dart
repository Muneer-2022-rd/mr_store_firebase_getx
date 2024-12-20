import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/device/utility.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  const CustomTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        overlayColor: WidgetStateProperty.all(
            TColors.getPrimaryColor(context).withValues(alpha: 0.1)),
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.getPrimaryColor(context),
        labelColor: dark ? TColors.white : TColors.getPrimaryColor(context),
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}
