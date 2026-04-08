import 'package:finalcrafty/app/crafty_bay.dart';
import 'package:flutter/material.dart';

import '../core/services/network_caller.dart';
import '../features/auth/presentations/screens/sign_in_screen.dart';
import 'controllers/auth_controller.dart';


NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () {
      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      if (AuthController.token != null) {
        headers['token'] = '${AuthController.token}';
      }
      return headers;
    },
    onUnauthorize: () async {
      await AuthController.clearUserData();
      _moveToSignInScreen();
    },
  );
}



void _moveToSignInScreen() {
  Navigator.pushNamed(
    CraftyBay.navigatorKey.currentContext!,
    SignInScreen.name,
  );
}