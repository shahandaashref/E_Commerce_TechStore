import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/signup_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details_page.dart';
import 'package:e_commerce/features/profile/presentation/pages/profile_page.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechStore',
      theme: ECommerceAppTheme.darkTheme,
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

  locale: const Locale('en'),

      initialRoute: '/profile',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) =>  SignupPage(), 
        '/productDetails': (context) => const ProductDetailsPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

