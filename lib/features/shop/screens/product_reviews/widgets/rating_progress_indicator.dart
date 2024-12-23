import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/core/device/utility.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtility.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              minHeight: 12,
              value: value,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor:
                  AlwaysStoppedAnimation(TColors.getPrimaryColor(context)),
            ),
          ),
        )
      ],
    );
  }
}
