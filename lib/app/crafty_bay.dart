
import 'package:finalcrafty/app/app_routes.dart';
import 'package:finalcrafty/app/app_theme.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
    );
  }
}
