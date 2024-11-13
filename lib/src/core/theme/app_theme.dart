import 'package:flutter/material.dart';
import 'package:fyrtel/src/core/theme/app_colors.dart';
import 'package:fyrtel/src/core/theme/app_text_styles.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: AppColors.appColorScheme,
  primaryColor: AppColors.appColorScheme.primary,
  scaffoldBackgroundColor: AppColors.appColorScheme.surfaceDim,
  textTheme: AppTextStyles.textTheme,
);
