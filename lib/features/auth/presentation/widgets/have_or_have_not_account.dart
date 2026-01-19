import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HaveOrHaveNotAcount extends StatelessWidget {
  final VoidCallback onPressed;
  final String tapText;
  final String text;
  const HaveOrHaveNotAcount({
    super.key,
    required this.onPressed,
    required this.text, required this.tapText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: theme.textTheme.bodyMedium),
        TextButton(
          onPressed: onPressed,
          child: Text(tapText, style: theme.textTheme.headlineSmall),
        ),
      ],
    );
  }
}
