import 'package:flutter/material.dart';
import '../core/services/network_caller.dart';
import '../features/auth/presentations/screens/sign_in_screen.dart';
import 'crafty_bay.dart';


NetworkCaller getNetworkCaller(){
  return NetworkCaller(headers: {
    'token':'sdf',
    'content-type':'application/json'
  }, unAuthorized: (){
    _moveToSignInScreen();
  });
}

void _moveToSignInScreen(){
  Navigator.pushNamed(CraftyBay.navigatorKey.currentContext!,
      SignInScreen.name);
}