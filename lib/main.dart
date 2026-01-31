import 'package:e_commerce/core/providers/product_provider.dart';
import 'package:e_commerce/core/providers/setting_provider.dart';
import 'package:e_commerce/features/cart/logic/cart_provider.dart';
import 'package:e_commerce/features/home/logic/home_provider.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),

        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],

      child: const MyApp(),
    ),
  );
}
