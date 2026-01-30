import 'package:e_commerce/core/providers/setting_provider.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/signup_page.dart';
import 'package:e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_place_holder.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details_page.dart';
import 'package:e_commerce/features/profile/presentation/pages/profile_page.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechStore',
      themeMode: settingsProvider.themeMode,
      theme: ECommerceAppTheme.lightTheme, 
      darkTheme: ECommerceAppTheme.darkTheme,
      localizationsDelegates: const[
        AppLocalizations.delegate, 
    GlobalMaterialLocalizations.delegate, 
    GlobalWidgetsLocalizations.delegate, 
    GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: const [
    Locale('en'), 
    Locale('ar'), 
  ],

  locale: settingsProvider.locale,

      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePlaceHolder(),
        '/login': (context) => const LoginPage(),
        '/register': (context) =>  SignupPage(), 
        '/productDetails': (context) => const ProductDetailsPage(),
        '/profile': (context) => const ProfilePage(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => const CartPage()
      },
    );
  }
}












