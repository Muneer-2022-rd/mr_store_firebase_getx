import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';

class AccountTypeCard extends StatelessWidget {
  final String accountType;
  const AccountTypeCard({
    super.key,
    required this.accountType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.getPrimaryColor(context).withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: ListTile(
        leading: Icon(Iconsax.card,
            color: TColors.getPrimaryColor(context), size: 28),
        title: Text(
          'Signed in via $accountType',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: const Text('This is your primary login method.'),
      ),
    );
  }
}
