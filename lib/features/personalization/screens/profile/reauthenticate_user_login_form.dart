import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Re-Authenticate User',
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
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      prefixIcon: Iconsax.direct_right,
                      controller: controller.verifyEmail,
                      labelText: TTexts.userEmail,
                      validator: (value) => TValidator.validateEmail(value),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Obx(
                      () => CustomTextFormField(
                        obscureText: controller.obscureText.value,
                        labelText: TTexts.userPassword,
                        prefixIcon: Iconsax.password_check4,
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            TValidator.validatePassword(value),
                        suffixIcon: IconButton(
                          onPressed: controller.showHidePassword,
                          icon: Icon(controller.obscureText.value == true
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtnSections),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPassword(),
                        child: Text(TTexts.register),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
