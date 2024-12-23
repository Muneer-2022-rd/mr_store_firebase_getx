import 'package:mr_store_getx_firebase/common/widgets/custom_text_form_field.dart';
import 'package:mr_store_getx_firebase/features/authentication/controllers/login/login_controller.dart';
import 'package:mr_store_getx_firebase/core/constants/routes.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/core/constants/texts.dart';
import 'package:mr_store_getx_firebase/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    final textDirection = Directionality.of(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtnSections),
        child: Column(
          children: [
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
            Obx(
              () => CustomTextFormField(
                obscureText: controller.obscureText.value,
                labelText: TTexts.userPassword,
                prefixIcon: Iconsax.password_check4,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                suffixIcon: IconButton(
                  onPressed: controller.showHidePassword,
                  icon: Icon(controller.obscureText.value == true
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        visualDensity: VisualDensity.comfortable,
                        value: controller.rememberMe.value,
                        onChanged: controller.rememberMeCheckbox,
                      ),
                    ),
                    Text(TTexts.loginRememberMe),
                  ],
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoute.forgetPassword),
                    child: Text(
                      TTexts.loginForgetPassword,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtnSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.navigationMenu),
                child: Text(TTexts.login),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtnItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.register),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
