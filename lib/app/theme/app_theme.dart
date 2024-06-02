import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    hintColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: TextStyle(color: AppColors.onBackground, fontSize: 20),
      iconTheme: IconThemeData(color: AppColors.onBackground),
    ),
    textTheme: const TextTheme(
      bodySmall: AppTextStyle.text18,
      bodyLarge: AppTextStyle.text16,
      bodyMedium: AppTextStyle.text12Gray,
      displayLarge: AppTextStyle.text28BoldWhite,
      displayMedium: AppTextStyle.text20Bold,
    ),
  );
}
