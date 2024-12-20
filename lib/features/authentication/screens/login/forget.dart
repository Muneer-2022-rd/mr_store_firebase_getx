import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/features/authentication/controllers/login_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                TTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.sm),
              Text(
                TTexts.forgetPasswordSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtnSections),
              CustomTextFormField(
                labelText: TTexts.userEmail,
                prefixIcon: Iconsax.direct_right,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) => TValidator.validateEmail(value),
              ),
              const SizedBox(height: TSizes.spaceBtnItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoute.successResetPassword),
                  child: Text(TTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
