import 'package:mr_store_getx_firebase/common/styles/spacing_style.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/constants/image.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(TImages.registerBeforeVerified)),
              Text(
                TTexts.verifyTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtnItems),
              Text(
                "muneer.socialmedia.1997@gmail.com",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtnItems),
              Text(
                TTexts.verifySubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.grey),
              ),
              const SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoute.success),
                  child: Text(TTexts.verify),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(TTexts.resend),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
