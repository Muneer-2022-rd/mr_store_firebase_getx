import 'package:flutter/material.dart';

class CustomListLayout extends StatelessWidget {
  const CustomListLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
