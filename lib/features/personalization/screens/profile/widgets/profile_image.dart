import 'package:mr_store_getx_firebase/common/widgets/circular_image.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String url;
  const ProfileImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        CircularImage(
          url: url,
          width: 150,
          height: 150,
        ),
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
              onTap: () {},
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
