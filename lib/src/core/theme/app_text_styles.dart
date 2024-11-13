import 'package:flutter/material.dart';

class AppTextStyles {
  static TextTheme textTheme = TextTheme(
      titleMedium: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
      bodyMedium: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
}
