import 'package:finalcrafty/features/auth/presentations/screens/verify_otp_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_in_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:finalcrafty/features/auth/presentations/screens/splash_screen.dart';
import 'package:finalcrafty/features/products/presentation/screens/product_details_screen.dart';
import 'package:finalcrafty/features/products/presentation/screens/product_list_screen.dart';
import 'package:finalcrafty/features/reviews/presentation/screens/create_review.dart';
import 'package:finalcrafty/features/reviews/presentation/screens/reviews_screen.dart';
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
      case VerifyOtpScreen.name:
        final email=settings.arguments as String;
        widget =VerifyOtpScreen(email: email,);
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
      case ProductDetailsScreen.name:
        widget=ProductDetailsScreen();
        break;
      case ReviewsScreen.name:
        widget=ReviewsScreen();
        break;
      case CreateReview.name:
        widget=CreateReview();
        break;

    }
    return MaterialPageRoute(builder: (context)=> widget);
  }
}