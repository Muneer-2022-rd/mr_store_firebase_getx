// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/collections.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/controllers/dummy_data_controller.dart';
import 'package:mr_store_getx_firebase/features/dummy_data/screens/widgets/dummy_data_button.dart';

class DummyDataScreen extends StatelessWidget {
  const DummyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDummyDataController());
    final List<UploadDummyDataModel> dataList = [
      UploadDummyDataModel(
        title: TCollections.categories,
        icon: Iconsax.category,
        onTap: () => controller.uploadCategoriesDummyData(),
      ),
      UploadDummyDataModel(
        title: TCollections.banners,
        icon: Iconsax.gallery,
        onTap: () => controller.uploadBannersDummyData(),
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Upload Dummy Data',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataList.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: TSizes.spaceBtnItems),
                itemBuilder: (context, index) => UploadDummyDataButton(
                  buttonTitle: dataList[index].title,
                  buttonPrefixIcon: dataList[index].icon,
                  onTap: () async => dataList[index].onTap(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadDummyDataModel {
  final String title;
  final IconData icon;
  final Function onTap;
  UploadDummyDataModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
