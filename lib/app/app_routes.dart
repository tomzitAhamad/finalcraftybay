import 'package:finalcrafty/features/auth/presentations/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    Widget widget=SizedBox();
    switch(settings.name){
      case '/':
        widget=SplashScreen();
        break;
    }
    return MaterialPageRoute(builder: (context)=> widget);
  }
}