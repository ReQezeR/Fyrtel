import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color.fromRGBO(0, 109, 166, 1),
    onPrimary: Colors.white,
    secondary: const Color.fromRGBO(32, 248, 175, 1),
    onSecondary: Colors.white,
    tertiary: const Color.fromRGBO(170, 137, 228, 1),
    onTertiary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    surfaceDim: Colors.grey.shade200,
    onSurface: Colors.black,
  );
}
