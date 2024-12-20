import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          TTexts.reviewsTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.reviewsSubtitle),
              const SizedBox(height: TSizes.spaceBtnItems),
              const OverallProductRating(),
              const RatingBarIndicatorWidget(rating: 3.5),
              Text('12,161', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtnSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
