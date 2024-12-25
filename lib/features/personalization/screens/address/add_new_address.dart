import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameC = TextEditingController();
    TextEditingController phoneC = TextEditingController();
    TextEditingController countryC = TextEditingController();
    TextEditingController cityC = TextEditingController();
    TextEditingController stateC = TextEditingController();
    TextEditingController streetC = TextEditingController();
    TextEditingController postalCodeC = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          TTexts.addNewAddress,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  controller: nameC,
                  labelText: TTexts.name,
                  prefixIcon: Iconsax.user,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                CustomTextFormField(
                  controller: phoneC,
                  labelText: TTexts.userPhone,
                  prefixIcon: Iconsax.mobile,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                CustomTextFormField(
                  controller: countryC,
                  labelText: TTexts.country,
                  prefixIcon: Iconsax.global,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: cityC,
                        labelText: TTexts.city,
                        prefixIcon: Iconsax.building,
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: CustomTextFormField(
                        controller: stateC,
                        labelText: TTexts.state,
                        prefixIcon: Iconsax.activity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: streetC,
                        labelText: TTexts.street,
                        prefixIcon: Iconsax.building_34,
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: CustomTextFormField(
                        controller: postalCodeC,
                        labelText: TTexts.postalCode,
                        prefixIcon: Iconsax.code,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtnSections),
                ElevatedButton(onPressed: () {}, child: Text(TTexts.save)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
