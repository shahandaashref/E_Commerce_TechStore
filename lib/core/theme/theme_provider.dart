import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // 1- define the theme mode
  ThemeMode _themeMode = ThemeMode.light;

  // 2- create getter for theme mode
  ThemeMode get currentThemeMode => _themeMode;
  //
  bool get isDark => currentThemeMode == ThemeMode.dark;

  // 3- create func to toggle the theme
  void changTheme(bool isOn) {
    isOn ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    notifyListeners();
  }
}