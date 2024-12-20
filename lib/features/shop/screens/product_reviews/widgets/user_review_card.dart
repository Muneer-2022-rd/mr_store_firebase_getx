import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.settingsMan),
                ),
                const SizedBox(width: TSizes.spaceBtnItems),
                Text('Muneer Radwan',
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtnItems),
        Row(
          children: [
            const RatingBarIndicatorWidget(rating: 3.5),
            const SizedBox(width: TSizes.spaceBtnItems),
            Text('01 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        ReadMoreText(
          'This premium T-shirt is crafted from 100% organic cotton, ensuring maximum comfort and durability. Perfect for casual outings, it features a sleek design with a modern fit. The breathable fabric keeps you cool and comfortable all day long. Available in multiple colors to match your style. Ideal for everyday wear or gifting!',
          trimLines: 2,
          colorClickableText: TColors.getPrimaryColor(context),
          trimMode: TrimMode.Line,
          trimCollapsedText: TTexts.readMore,
          trimExpandedText: TTexts.readLess,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('01 Nov, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtnItems),
                ReadMoreText(
                  'Available in multiple colors to match your style. Ideal for everyday wear or gifting!',
                  trimLines: 1,
                  colorClickableText: TColors.getPrimaryColor(context),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: TTexts.readMore,
                  trimExpandedText: TTexts.readLess,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtnSections),
      ],
    );
  }
}
