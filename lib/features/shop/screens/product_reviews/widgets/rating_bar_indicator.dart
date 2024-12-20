import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class RatingBarIndicatorWidget extends StatelessWidget {
  final double rating;
  const RatingBarIndicatorWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (context, index) =>
          Icon(Iconsax.star1, color: TColors.getPrimaryColor(context)),
    );
  }
}
