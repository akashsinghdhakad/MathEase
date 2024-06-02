import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData appThemeLight() {
    ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lightBlueAccent,
        surface: const Color(0xFFFBF7F7),
      ),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
    return themeData;
  }
}
