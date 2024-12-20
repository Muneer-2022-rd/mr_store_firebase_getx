import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/choice_chip.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final List<Map<String, dynamic>> colorsList = [
      {'color': 'amber', 'selected': false},
      {'color': 'black', 'selected': false},
      {'color': 'blue', 'selected': false},
      {'color': 'bluegrey', 'selected': true},
      {'color': 'brown', 'selected': false},
      {'color': 'cyan', 'selected': false},
      {'color': 'deeporange', 'selected': false},
      {'color': 'deeppurple', 'selected': false},
      {'color': 'green', 'selected': false},
      {'color': 'grey', 'selected': false},
      {'color': 'indigo', 'selected': false},
      {'color': 'lightblue', 'selected': false},
      {'color': 'lightgreen', 'selected': false},
      {'color': 'lime', 'selected': false},
      {'color': 'orange', 'selected': false},
      {'color': 'pink', 'selected': false},
      {'color': 'purple', 'selected': false},
      {'color': 'red', 'selected': false},
      {'color': 'teal', 'selected': false},
      {'color': 'yellow', 'selected': false},
      {'color': 'white', 'selected': false},
      {'color': 'beige', 'selected': false},
    ];
    final List<Map<String, dynamic>> sizesList = [
      {'size': 'XS', 'selected': false},
      {'size': 'XXS', 'selected': false},
      {'size': 'S', 'selected': true},
      {'size': 'M', 'selected': false},
      {'size': 'L', 'selected': false},
      {'size': 'XL', 'selected': false},
      {'size': 'XXL', 'selected': false},
    ];
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  SeactionHeading(
                    title: TTexts.variation,
                    showActionButton: false,
                  ),
                  const SizedBox(width: TSizes.spaceBtnItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitleText(
                              title: '${TTexts.price} :', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtnItems / 2),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtnItems / 2),
                          const ProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(
                              title: "${TTexts.status} :", smallSize: true),
                          const SizedBox(width: TSizes.spaceBtnItems / 2),
                          Text(TTexts.inStock,
                              style: Theme.of(context).textTheme.titleMedium!)
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ProductTitleText(
                title:
                    'A comfortable and stylish cotton shirt, perfect for everyday wear.',
                smallSize: true,
                maxLine: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        Column(
          children: <Widget>[
            SeactionHeading(title: TTexts.colors),
            const SizedBox(height: TSizes.spaceBtnItems / 2),
            Wrap(
              spacing: 4,
              children: colorsList
                  .map((e) => ChoiceChipWidget(
                        text: e['color'],
                        selected: e['selected'],
                        onSelected: (p0) {},
                      ))
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtnItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SeactionHeading(title: TTexts.sizes),
            const SizedBox(height: TSizes.spaceBtnItems / 2),
            Wrap(
              spacing: 8,
              children: sizesList
                  .map((e) => ChoiceChipWidget(
                        text: e['size'],
                        selected: e['selected'],
                        onSelected: (p0) {},
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
