import 'package:finalcrafty/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.light,
    progressIndicatorTheme: _progressIndicatorTheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecoration,
    filledButtonTheme: _filledButtonThemeData,
  );
  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressIndicatorTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecoration,
      filledButtonTheme: _filledButtonThemeData,
  );
  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColors.themeColor);

  static TextTheme get _textTheme {
    return TextTheme(titleLarge: TextStyle(fontWeight: FontWeight.w700));
  }
  static FilledButtonThemeData get _filledButtonThemeData{
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
          backgroundColor: AppColors.themeColor
      ),
    );
  }
  static InputDecorationTheme get _inputDecoration{
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;
}
