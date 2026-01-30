import 'package:flutter/material.dart';

class ECommerceAppTheme {
  // Primary Blue Colors
  static const Color primary = Color(0xFF3B82F6); // Blue 500
  static const Color primaryDark = Color(0xFF2563EB); // Blue 600
  static const Color primaryLight = Color(0xFF60A5FA); // Blue 400

  // Secondary & Accent
  static const Color secondary = Color(0xFF8B5CF6); // Purple 500
  static const Color accent = Color(0xFF06B6D4); // Cyan 500

  // Backgrounds (Dark Mode)
  static const Color background = Color(0xFF0F172A); // Slate 900 (Main BG)
  static const Color surface = Color(0xFF1E293B); // Slate 800 (Cards)
  static const Color surfaceLight = Color(0xFF334155); // Slate 700

  // Text Colors
  static const Color textPrimary = Color(0xFFF1F5F9); // Slate 100 (White-ish)
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400 (Grey)
  static const Color textTertiary = Color(0xFF64748B); // Slate 500

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Borders
  static const Color border = Color(0xFF334155);

  static ColorScheme get colorScheme {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimaryContainer: textPrimary,
      onPrimary: textPrimary,
      secondary: secondary,
      surface: surface,
      error: error,
      onSecondary: textPrimary,
      onSurface: textPrimary,
      onError: textPrimary,
       
    );
  }

  // Padding & Margin
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Border Radius 
  static const double radiusSm = 6.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;

  static TextTheme get textTheme {
    return const TextTheme(
      // Heading one - 28px, Newsreader display, Medium
      displayLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        letterSpacing: -0.5,
      ),

      // Heading two - 24px, Newsreader display, Medium
      displayMedium: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: -0.25,
      ),

      // Heading three - 20px, Newsreader display, Medium
      displaySmall: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: 0.0,
      ),

      //subtitle - 20px, Inter, Medium
      headlineLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: primary,
        height: 1.5,
      ),

      // Subtitle - 18px, Inter, Medium
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: primary,
        height: 1.5,
      ),

      // Subtitle Small - 16px, Inter, Medium
      headlineSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primary,
        height: 1.5,
      ),

      // Body Large - 16px, Inter, Regular
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textPrimary,
        height: 1.5,
      ),

      // Body Medium - 14px, Inter, Regular
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.5,
      ),

      // Body Small - 12px, Inter, Regular
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textTertiary,
        height: 1.5,
      ),

      // Button Text - 14px, Inter, Medium
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.25,
      ),

      // Caption - 12px, Inter, Regular
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        letterSpacing: 1.0,
      ),

      // Overline - 10px, Inter, Regular
      labelMedium : TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textTertiary,
        letterSpacing: 1.5,
      ),
    );
  }

  static ThemeData get lightTheme {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.white,
    

    textTheme: textTheme.apply(
      bodyColor: const Color(0xFF1E293B),
      displayColor: const Color(0xFF0F172A), 
    ),
    
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: Colors.white,
      onSurface: Color(0xFF1E293B),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        fixedSize: const Size(double.infinity, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
        ),
        textStyle: textTheme.displayMedium,
      ),
    ),
    

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF1E293B),
      elevation: 0,
    ),
  );
}

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      colorScheme: colorScheme,

      // text form field theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(color: primary, width: 2.0),
        ),
        labelStyle: const TextStyle(color: textSecondary),
        hintStyle: const TextStyle(color: textTertiary),
        prefixIconColor: textSecondary,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        
      ),
      
      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          fixedSize: const Size(double.infinity, 50),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: xl,
            vertical: md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
          ),
          textStyle:textTheme.displayMedium ,
        ),
      ),  
      dividerTheme: DividerThemeData(
        color: border,
        thickness: 1.0,
        
      ),
      listTileTheme: ListTileThemeData(
        iconColor: primary,
        textColor: textPrimary,
        
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: textTheme.labelLarge,
        unselectedLabelStyle: textTheme.labelSmall,
      ),
      
          

    );
  }
}
