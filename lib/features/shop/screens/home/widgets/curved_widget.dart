import 'package:flutter/material.dart';
import 'custom_cliper.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(context: context),
      child: child,
    );
  }
}
