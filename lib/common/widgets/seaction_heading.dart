import 'package:flutter/material.dart';

class SeactionHeading extends StatelessWidget {
  const SeactionHeading({
    super.key,
    this.textColor,
    this.showActionButton = false,
    required this.title,
    this.buttonTitle = "view all",
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          Flexible(
            child: InkWell(
              onTap: onPressed,
              child: Text(
                buttonTitle,
                style: TextStyle(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
      ],
    );
  }
}
