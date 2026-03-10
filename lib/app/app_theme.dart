import 'package:finalcrafty/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightThemeData=ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness:Brightness.light,
    progressIndicatorTheme:_progressIndicatorTheme,
    scaffoldBackgroundColor: Colors.white
  );
  static final ThemeData _darkThemeData=ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      brightness:Brightness.dark,
    progressIndicatorTheme:_progressIndicatorTheme,
    scaffoldBackgroundColor: Colors.black
  );
  static ProgressIndicatorThemeData get _progressIndicatorTheme=>ProgressIndicatorThemeData(
    color: AppColors.themeColor
  );

  static ThemeData get lightTheme=>_lightThemeData;
  static ThemeData get darkTheme=>_darkThemeData;
}