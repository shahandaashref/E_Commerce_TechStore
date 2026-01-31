
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BannerInHomePage extends StatefulWidget {
  const BannerInHomePage({super.key});

  @override
  State<BannerInHomePage> createState() => _BannerInHomePageState();
}

class _BannerInHomePageState extends State<BannerInHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusLg),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusLg),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.loc.nowYearSale,
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                //todo: implement shop now action
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text(
                context.loc.shopNow,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }