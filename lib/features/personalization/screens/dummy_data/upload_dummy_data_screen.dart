import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/dummy_data_controller.dart';

class UploadDummyDataScreen extends StatelessWidget {
  const UploadDummyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DummyDataController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Upload Data',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => controller.uploadCategories(),
                  child: Text('Upload Dummy Categories'),
                ),
              ),
              SizedBox(height: TSizes.spaceBtnItems),
            ],
          ),
        ),
      ),
    );
  }
}
