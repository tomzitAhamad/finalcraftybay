import 'package:finalcrafty/features/auth/presentations/screens/password_otp_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_in_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/splash_screen.dart';
import 'package:finalcrafty/features/products/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../features/shared/presentation/screens/main_nav_holder_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    Widget widget=SizedBox();
    switch(settings.name){
      case SplashScreen.name:
        widget=SplashScreen();
        break;
      case SignUpScreen.name:
        widget=SignUpScreen();
        break;
      case PasswordOtpScreen.name:
        widget =PasswordOtpScreen();
        break;
      case SignInScreen.name:
        widget=SignInScreen();
        break;
      case MainNavHolderScreen.name:
        widget=MainNavHolderScreen();
        break;
      case ProductListScreen.name:
        final categoryName=settings.arguments as String;
        widget=ProductListScreen(categoryName: categoryName);
        break;

    }
    return MaterialPageRoute(builder: (context)=> widget);
  }
}