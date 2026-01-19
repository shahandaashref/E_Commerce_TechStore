import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context);
    return InkWell(
      onTap: () {
        // todo: implement google sign-in
      },
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: ECommerceAppTheme.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            
            Image.asset(
              'assets/images/google.png',
              height: 24,
              width: 24,
            ),
            SizedBox(width: 10),
            Text(
              localization!.continueWithGoogle,
              style: theme.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}