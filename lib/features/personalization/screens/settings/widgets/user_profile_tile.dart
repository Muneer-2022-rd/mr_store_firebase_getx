import 'package:mr_store_getx_firebase/common/shimmer/shimmer_effect.dart';
import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';
import 'package:mr_store_getx_firebase/features/personalization/screens/profile/profile.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image =
            networkImage!.isNotEmpty ? networkImage : TImages.settingsMan;
        return controller.imageUploading.value
            ? ShimmerEffect(height: 50, width: 50, radius: 100)
            : CircularImage(
                url: image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                padding: EdgeInsets.zero,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(controller.user.value.fullName,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(controller.user.value.email!,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      trailing: InkWell(
        onTap: () {
          Get.to(() => ProfileScreen());
        },
        child: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
