import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _lightThemeData=ThemeData();
  static ThemeData _darkThemeData=ThemeData();

  static ThemeData get lighttheme=>_lightThemeData;
  static ThemeData get darktheme=>_darkThemeData;
}