import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/update_username_controller.dart';

class ChangeUserNameScreen extends StatelessWidget {
  const ChangeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Change Username',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Use ideal username for easy verification. This name will appear in several pages.',
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtnSections),
              Form(
                key: controller.updateNameFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      prefixIcon: Iconsax.user,
                      controller: controller.userName,
                      labelText: 'Username',
                      validator: (value) =>
                          TValidator.validateEmptyText(value, 'Username'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
