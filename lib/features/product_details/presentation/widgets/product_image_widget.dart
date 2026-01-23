
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

Container productImageInDetails(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 300,
      color: ECommerceAppTheme.textSecondary,
      child: Center(child: Image.asset(imageUrl, fit: BoxFit.cover)),
    );
  }