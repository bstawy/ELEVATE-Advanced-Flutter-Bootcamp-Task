import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF004182),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF004182),
      primary: const Color(0xFF004182),
      surface: Colors.white,
    ),
    useMaterial3: true,
  );
}
