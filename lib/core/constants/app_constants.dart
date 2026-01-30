import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get loc => AppLocalizations.of(this)!;
}
