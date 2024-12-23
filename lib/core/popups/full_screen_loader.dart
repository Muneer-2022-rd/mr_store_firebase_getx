import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_store_getx_firebase/common/widgets/loader/animation_loader.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              AnimationLoaderWidget(
                text: text,
                animation: animation,
                showAction: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
   
    Navigator.of(Get.overlayContext!).pop();
  }
}
