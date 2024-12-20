import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.onPressed,
    this.iconData,
  });
  final String title;
  final String value;
  final VoidCallback? onPressed;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData ?? Iconsax.arrow_right_34,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
