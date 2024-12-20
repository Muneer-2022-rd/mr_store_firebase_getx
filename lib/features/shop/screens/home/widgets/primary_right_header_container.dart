import 'package:mr_store_getx_firebase/common/widgets/circular_container.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';

import 'curved_widget.dart';

class PrimaryRightHeaderContainer extends StatelessWidget {
  const PrimaryRightHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                    backgroundColor: TColors.getSecondryColor(context))),
            Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                    backgroundColor: TColors.getThirdColor(context))),
            child
          ],
        ),
      ),
    );
  }
}
