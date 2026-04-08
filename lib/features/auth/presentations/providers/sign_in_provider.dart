import 'package:finalcrafty/app/controllers/auth_controller.dart';
import 'package:finalcrafty/features/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;
  bool get signInProgress => _signInProgress;
  String? _errorMassage;
  String? get errorMassage => _errorMassage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: {'email': email, 'password': password},
      isFromLogin: true
    );

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.body['data']['user']);
      String token = response.body['data']['token'];
      await AuthController.saveUserData(token, userModel);
      _errorMassage = null;
      isSuccess = true;
    } else {
      _errorMassage = response.errorMassage;
    }
    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
