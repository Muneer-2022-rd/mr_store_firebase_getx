import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final String dividerText;
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Flexible(
          child: Divider(
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}