import 'package:firebase_core/firebase_core.dart';
import 'package:mr_store_getx_firebase/firebase_options.dart';
import 'package:mr_store_getx_firebase/routes.dart';
import 'package:mr_store_getx_firebase/core/locale/locale.dart';
import 'package:mr_store_getx_firebase/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
          home: child,
        );
      },
    );
  }
}
// flutter build apk --split-per-abi
