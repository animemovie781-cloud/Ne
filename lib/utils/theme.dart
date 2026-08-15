import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF9333ea);
  static const Color secondary = Color(0xFFec4899);
  static const Color primaryLight = Color(0xFFa855f7);
  static const Color body = Color(0xFF09090b);
  static const Color surface = Color(0xFF181832);
  static const Color text = Color(0xFF94a3b8);
  static const Color link = Color(0xFF94a3b8);
  static const Color linkHover = Color(0xFF28c2bd);
  static const Color dark = Color(0xFF181832);
  static const Color gray = Color(0xFF181832);
  static const Color grayLight = Color(0xFF181832);
  static const Color grayDark = Color(0xFFeee);
  static const Color white = Colors.white;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: body,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        onPrimary: white,
        onSecondary: white,
        onSurface: text,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: white, fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: text, fontSize: 16),
        bodyMedium: TextStyle(color: text, fontSize: 14),
        bodySmall: TextStyle(color: text, fontSize: 12),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: body,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF020209),
        selectedItemColor: primary,
        unselectedItemColor: text,
        type: BottomNavigationBarType.fixed,
      ),
      cardColor: surface,
      dividerColor: Colors.white10,
    );
  }
}
