
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/shop/models/category_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/sub_category/widgets/product_card_horizontal.dart';

class SubCategorySection extends StatelessWidget {
  final CategoryModel category;
  const SubCategorySection({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SeactionHeading(
          title: category.name!,
          onPressed: () {},
          showActionButton: true,
        ),
        SizedBox(height: TSizes.spaceBtnItems),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: TSizes.spaceBtnItems),
            itemCount: 3,
            itemBuilder: (context, index) => ProductCardHorizontal(),
          ),
        )
      ],
    );
  }
}
