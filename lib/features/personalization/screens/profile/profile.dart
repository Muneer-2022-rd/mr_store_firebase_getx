import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/account_type_card.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/custom_action_button.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/profile_image.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage(url: TImages.settingsMan),
              SizedBox(height: TSizes.spaceBtnItems.h),
              const AccountTypeCard(accountType: 'Google'),
              SizedBox(height: TSizes.spaceBtnItems.h / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems.h),
              const SeactionHeading(title: 'Profile Information'),
              SizedBox(height: TSizes.spaceBtnItems.h),
              ProfileMenu(
                title: 'User-ID',
                value: '234234',
                iconData: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'E-mail',
                value: 'firebase.projects.1997@gmail.com',
                iconData: Iconsax.copy,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtnItems.h / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems.h),
              const SeactionHeading(title: 'Personal Information'),
              SizedBox(height: TSizes.spaceBtnItems.h),
              ProfileMenu(
                title: 'Username',
                value: 'muniro2027',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Name',
                value: 'Muneer Radwan',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: '(963) 934840928',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Date Of Birth',
                value: '10 Oct, 1997',
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtnItems.h / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomActionButton(
                    icon: Iconsax.logout,
                    label: 'Logout',
                    color: TColors.getPrimaryColor(context),
                    onPressed: () {},
                  ),
                  SizedBox(height: TSizes.spaceBtnItems.h),
                  CustomActionButton(
                    icon: Iconsax.trash,
                    label: 'Delete Account',
                    color: TColors.darkerGrey,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
