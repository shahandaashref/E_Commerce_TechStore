
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.categories,
              style: context.textTheme.headlineLarge?.copyWith(
                color: ECommerceAppTheme.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                context.loc.seeAll,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: ECommerceAppTheme.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  //todo: implement category tap action
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  height: 80,
                  decoration: BoxDecoration(
                    color: ECommerceAppTheme.surface,
                    borderRadius: BorderRadius.circular(
                      ECommerceAppTheme.radiusMd,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ECommerceAppTheme.primary.withValues(alpha: 0.1),
                            ECommerceAppTheme.primary.withValues(alpha: 0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          ECommerceAppTheme.radiusMd,
                        ),
                      ),
                      child: Column(
                        children: [
                          categories.values.elementAt(index),
                          Text(
                            categories.keys.elementAt(index),
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 9,
                              color: ECommerceAppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  }

  Map<String, Icon> categories = {
  'Smarthphonse': Icon(Icons.phone_android_outlined),
  'laptops': Icon(Icons.laptop_mac_outlined),
  'Audio': Icon(Icons.headphones_outlined),
  'Wearables': Icon(Icons.watch_outlined),
  'Gamming': Icon(Icons.sports_esports_outlined),
  'Cameras': Icon(Icons.camera_alt_outlined),
  'Tablets': Icon(Icons.tablet_mac_outlined),
  "Accessories": Icon(Icons.cable_outlined),
};