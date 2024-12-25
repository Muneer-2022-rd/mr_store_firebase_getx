import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';

class DummyDataScreen extends StatelessWidget {
  const DummyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload Categories'),
              ),
              SizedBox(height: TSizes.spaceBtnItems),
            ],
          ),
        ),
      ),
    );
  }
}
