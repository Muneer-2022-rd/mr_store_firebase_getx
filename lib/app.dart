import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/bindings/general_binding.dart';
import 'package:mr_store_getx_firebase/core/locale/locale.dart';
import 'package:mr_store_getx_firebase/core/theme/theme.dart';
import 'package:mr_store_getx_firebase/features/authentication/screens/onboarding/onboarding.dart';
import 'package:mr_store_getx_firebase/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      locale: Get.deviceLocale,
      fallbackLocale: Get.deviceLocale,
      translations: MyLocale(),
      getPages: routes,
      home: OnBoardingScreen(),
      initialBinding: GeneralBindings(),
    );
  }
}
// flutter build apk --split-per-abi
