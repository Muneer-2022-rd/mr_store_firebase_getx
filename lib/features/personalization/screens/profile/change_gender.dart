import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/update_gender_controller.dart';

class ChangeGenderScreen extends StatelessWidget {
  const ChangeGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Change Gender',
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
                  'Use real gender for easy organization. Your Gender will be private for others.',
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtnSections),
              DropdownButtonFormField(
                items: ['male', 'female']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.gender.text = value!;
                },
                value: controller.gender.text,
              ),
              SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateGender(),
                    child: Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
