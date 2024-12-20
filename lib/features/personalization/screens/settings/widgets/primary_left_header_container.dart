import 'package:mr_store_getx_firebase/common/widgets/circular_container.dart';
import 'package:flutter/material.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/features/shop/screens/home/widgets/curved_widget.dart';

class PrimaryLeftHeaderContainer extends StatelessWidget {
  const PrimaryLeftHeaderContainer({
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
                top: -50,
                left: -100,
                child: CircularContainer(
                    backgroundColor: TColors.getSecondryColor(context),
                    height: 200,
                    width: 200)),
            Positioned(
                top: 75,
                left: -75,
                child: CircularContainer(
                    backgroundColor: TColors.getThirdColor(context),
                    height: 200,
                    width: 200)),
            child
          ],
        ),
      ),
    );
  }
}
