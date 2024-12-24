import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mr_store_getx_firebase/core/constants/colors.dart';
import 'package:mr_store_getx_firebase/data/repositories/authentication/authentication_repository.dart';

class AccountTypeCard extends StatelessWidget {
  const AccountTypeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
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
          'Signed in via ${controller.checkSignInMethod()}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: const Text('This is your primary login method.'),
      ),
    );
  }
}
