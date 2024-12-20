import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final IconData leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: Theme.of(context).primaryColor),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium!,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
