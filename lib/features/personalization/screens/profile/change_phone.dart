import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mr_store_getx_firebase/common/widgets/custom_app_bar.dart';
import 'package:mr_store_getx_firebase/core/constants/sizes.dart';
import 'package:mr_store_getx_firebase/features/personalization/controllers/update_phone_controller.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Change Phone Number',
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
                  'Use real phone for easy organization. Your phone will be private for others.',
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtnSections),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                countries: [
                  Country(
                    name: "Syrian Arab Republic",
                    nameTranslations: {
                      "sk": "Sýria",
                      "se": "Syria",
                      "pl": "Syria",
                      "no": "Syria",
                      "ja": "シリア",
                      "it": "Siria",
                      "zh": "叙利亚",
                      "nl": "Syrië",
                      "de": "Syrien",
                      "fr": "Syrie",
                      "es": "Siria",
                      "en": "Syria",
                      "pt_BR": "Síria",
                      "sr-Cyrl": "Сирија",
                      "sr-Latn": "Sirija",
                      "zh_TW": "敘利亞",
                      "tr": "Suriye",
                      "ro": "Siria",
                      "ar": "سوريا",
                      "fa": "سوریه",
                      "yue": "阿拉伯敘利亞共和國"
                    },
                    flag: "🇸🇾",
                    code: "SY",
                    dialCode: "963",
                    minLength: 10,
                    maxLength: 10,
                  ),
                ],
                initialCountryCode: 'SY',
                controller: controller.phoneNumber,
              ),
              SizedBox(height: TSizes.spaceBtnSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updatePhone(),
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
