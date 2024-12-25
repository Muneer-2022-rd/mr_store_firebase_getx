import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';

import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_birthdate.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_gender.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_name.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_phone.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/change_username.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/account_type_card.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/custom_action_button.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/profile_image.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
              ProfileImage(),
              SizedBox(height: TSizes.spaceBtnItems),
              const AccountTypeCard(),
              SizedBox(height: TSizes.spaceBtnItems / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems),
              const SeactionHeading(title: 'Profile Information'),
              SizedBox(height: TSizes.spaceBtnItems),
              ProfileMenu(
                title: 'User-ID',
                value: controller.user.value.id!,
                iconData: Iconsax.copy,
                onPressed: () =>
                    THelperFunctions.copyText(controller.user.value.email!),
              ),
              ProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email!,
                iconData: Iconsax.copy,
                onPressed: () =>
                    THelperFunctions.copyText(controller.user.value.email!),
              ),
              SizedBox(height: TSizes.spaceBtnItems / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems),
              const SeactionHeading(title: 'Personal Information'),
              SizedBox(height: TSizes.spaceBtnItems),
              ProfileMenu(
                title: 'Username',
                value: controller.user.value.userName!,
                onPressed: () => Get.to(() => ChangeUserNameScreen()),
              ),
              ProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => ChangeNameScreen()),
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber ?? '',
                onPressed: () => Get.to(() => ChangePhoneScreen()),
              ),
              ProfileMenu(
                title: 'Gender',
                value: controller.user.value.gender ?? '',
                onPressed: () => Get.to(() => ChangeGenderScreen()),
              ),
              ProfileMenu(
                title: 'Date Of Birth',
                value: controller.user.value.birthDate ?? '',
                onPressed: () => Get.to(() => ChangeBirthDateScreen()),
              ),
              SizedBox(height: TSizes.spaceBtnItems / 2),
              const Divider(),
              SizedBox(height: TSizes.spaceBtnItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomActionButton(
                    icon: Iconsax.logout,
                    label: 'Logout',
                    color: TColors.getPrimaryColor(context),
                    onPressed: () => AuthenticationRepository.instance.logout(),
                  ),
                  SizedBox(height: TSizes.spaceBtnItems),
                  CustomActionButton(
                    icon: Iconsax.trash,
                    label: 'Delete Account',
                    color: TColors.darkerGrey,
                    onPressed: () => controller.deleteAccountWarningPopup(),
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
