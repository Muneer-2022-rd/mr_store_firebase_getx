import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShareWidget extends StatelessWidget {
  const RatingAndShareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: TSizes.spaceBtnItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const WidgetSpan(
                  child: SizedBox(width: TSizes.spaceBtnItems / 2)),
              const TextSpan(text: '(199)')
            ]))
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: TSizes.iconMd,
          ),
        )
      ],
    );
  }
}
