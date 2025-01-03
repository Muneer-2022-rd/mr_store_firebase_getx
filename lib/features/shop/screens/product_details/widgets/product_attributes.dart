import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/rounded_container.dart';
import 'package:mr_store_getx_firebase/common/widgets/seaction_heading.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';
import 'package:mr_store_getx_firebase/features/shop/controllers/product/variation_controller.dart';
import 'package:mr_store_getx_firebase/features/shop/models/product_model.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_price_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/product_title_text.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/product_details/widgets/choice_chip.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  final ProductModel product;
  const ProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(() {
      return Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: TSizes.spaceBtnItems / 2),
                              ProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              ProductTitleText(
                                  title: "${TTexts.status} :", smallSize: true),
                              const SizedBox(width: TSizes.spaceBtnItems / 2),
                              Text(controller.variationStockState.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium!)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ProductTitleText(
                    title: controller.selectedVariation.value.description!,
                    smallSize: true,
                    maxLine: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtnItems),
          Column(
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SeactionHeading(title: attribute.name!),
                        Obx(() {
                          return Wrap(
                            spacing: 4,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttribuetsAvailabillityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return ChoiceChipWidget(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          );
                        }),
                        const SizedBox(height: TSizes.spaceBtnItems),
                      ],
                    ),
                  )
                  .toList()),
        ],
      );
    });
  }
}
