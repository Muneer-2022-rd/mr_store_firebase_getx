import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../constants/colors.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'amber':
        return Colors.amber;
      case 'black':
        return TColors.black;
      case 'blue':
        return TColors.primary;
      case 'bluegrey':
        return Colors.blueGrey;
      case 'brown':
        return Colors.brown;
      case 'cyan':
        return Colors.cyan;
      case 'deeporange':
        return Colors.deepOrange;
      case 'deeppurple':
        return Colors.deepPurple;
      case 'green':
        return Colors.green;
      case 'grey':
        return TColors.grey;
      case 'indigo':
        return Colors.indigo;
      case 'lightblue':
        return Colors.lightBlue;
      case 'lightgreen':
        return Colors.lightGreen;
      case 'lime':
        return Colors.lime;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'teal':
        return Colors.teal;
      case 'yellow':
        return Colors.yellow;
      case 'white':
        return TColors.white;
      case 'beige':
        return const Color(0xffF5F5DC);
    }
    return null;
  }

  static void showBlackSnackBar({required String message}) {
    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  static void showColoredSnackBar({
    required BuildContext context,
    required String message,
    required String title,
    ContentType? type,
    SnackBarBehavior? behavior,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: behavior ?? SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type ?? ContentType.help,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showAlert({
    required String title,
    required String message,
    String? buttonTitle,
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonTitle ?? 'OK'))
        ],
      ),
    );
  }

  static void openLoadingDialog(
    String text,
    String animation,
    BuildContext context,
  ) {
    final dark = THelperFunctions.isDarkMode(context);
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: dark ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              LottieBuilder.asset(
                animation,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void navigateToScreen({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static String truncateText(String text, int maxLenth) {
    if (text.length <= maxLenth) {
      return text;
    } else {
      return '${text.substring(0, maxLenth)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }

}
