import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/formatters/formatter.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/update_birthdate_controller.dart';

class ChangeBirthDateScreen extends StatelessWidget {
  const ChangeBirthDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateBirthDateController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Change Birth Date',
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
                  'Use real birth date for easy organization. Your Birthdate will be private for others.',
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                    controller.birthDate.text = TFormatter.formatDate(date);
                  },
                  child: Text(controller.birthDate.text == ''
                      ? 'Birth Date'
                      : controller.birthDate.text),
                ),
              ),
              SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateBirthDate(),
                  child: Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
