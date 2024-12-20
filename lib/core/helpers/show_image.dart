import 'package:flutter/material.dart';

void showImageDialog(
    {required BuildContext context, required String imageUrl,required bool isNetworkImage}) {
  // this is our simple dialog display code
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isNetworkImage ? Image.network(imageUrl) : Image.asset(imageUrl),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}
