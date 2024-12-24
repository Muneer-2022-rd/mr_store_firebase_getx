import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:mr_store_getx_firebase/features/authentication/controllers/register/register_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    final textDirection = Directionality.of(context);
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtnSections),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: TTexts.userFirst,
                    prefixIcon: Iconsax.user,
                    keyboardType: TextInputType.text,
                    controller: controller.firstName,
                    validator: (value) =>
                    TValidator.validateEmptyText(value, TTexts.userFirst),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: CustomTextFormField(
                    labelText: TTexts.userLast,
                    prefixIcon: Iconsax.user,
                    keyboardType: TextInputType.text,
                    controller: controller.lastName,
                    validator: (value) =>
                    TValidator.validateEmptyText(value, TTexts.userLast),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            CustomTextFormField(
              labelText: TTexts.userName,
              prefixIcon: Iconsax.personalcard,
              keyboardType: TextInputType.text,
              controller: controller.userName,
              validator: (value) =>
              TValidator.validateEmptyText(value, TTexts.userName),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            CustomTextFormField(
              labelText: TTexts.userEmail,
              prefixIcon: textDirection == TextDirection.ltr
                  ? Iconsax.direct_right
                  : Iconsax.direct_left,
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(() => CustomTextFormField(
                  obscureText: controller.obscureText.value,
                  labelText: TTexts.userPassword,
                  prefixIcon: Iconsax.password_check,
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  suffixIcon: IconButton(
                    onPressed: controller.showHidePassword,
                    icon: Icon(controller.obscureText.value == true
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                )),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Row(
              children: [
                Obx(() => Checkbox(
                      visualDensity: VisualDensity.comfortable,
                      value: controller.privacyPolicy.value,
                      onChanged: controller.privacyPolicyCheckbox,
                    )),
                Flexible(
                  child: RichText(
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelLarge,
                      children: [
                        TextSpan(text: TTexts.registerIAgreeTo),
                        const WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(
                          text: TTexts.registerPrivacyPolicy,
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(text: TTexts.registerAnd),
                        const WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(
                          text: TTexts.registerTermsOfUse,
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtnSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: Text(TTexts.register),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
