import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/shimmer/shimmer_effect.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = UserController.instance;
    return Stack(
      children: [
        Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =
              networkImage!.isNotEmpty ? networkImage : TImages.settingsMan;
          return controller.imageUploading.value
              ? ShimmerEffect(height: 150, width: 150, radius: 100)
              : CircularImage(
                  url: image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        }),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: dark ? TColors.darkerGrey : TColors.softGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () => controller.uploadUserProfilePicture(),
              child: Text(
                'Change Picture',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        )
      ],
    );
  }
}
