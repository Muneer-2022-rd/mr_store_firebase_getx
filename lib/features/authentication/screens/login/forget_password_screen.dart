import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
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
              Form(
                key: controller.forgetPasswordFormKey,
                child: CustomTextFormField(
                  labelText: TTexts.userEmail,
                  prefixIcon: Iconsax.direct_right,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.email,
                  validator: (value) => TValidator.validateEmail(value),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtnItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: Text(TTexts.submit),
                ),
              ),
              TextButton(
                onPressed: () => controller.resendPasswordResetEmail(controller.email.text.trim()),
                child: Text(TTexts.resend),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
