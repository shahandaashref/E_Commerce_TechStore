import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  
  Locale _locale = const Locale('en'); 
  ThemeMode _themeMode = ThemeMode.dark;


  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;


  SettingsProvider() {
    _loadSettings();
  }


  void changeLanguage(String languageCode) async {
    _locale = Locale(languageCode);
    notifyListeners(); 
    

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }


  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); 


    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }


  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    

    final String? lang = prefs.getString('language');
    if (lang != null) {
      _locale = Locale(lang);
    }


    final bool? isDark = prefs.getBool('isDark');
    if (isDark != null) {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
    
    notifyListeners();
  }
}