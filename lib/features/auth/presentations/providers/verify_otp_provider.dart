
import 'package:finalcrafty/app/controllers/auth_controller.dart';
import 'package:finalcrafty/features/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';


class VerifyOtpProvider extends ChangeNotifier {
  bool _verifyOtpInProgress = false;
  bool get verifyOtpInProgress => _verifyOtpInProgress;
  String? _errorMassage;
  String? get errorMassage => _errorMassage;

  Future<bool> verifyOtp(String email,String otp) async {
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.verifyOtpUrl,
      body: {
        'email':email,
        'otp':otp
      },
    );

    if (response.isSuccess){
      UserModel userModel=UserModel.fromJson(response.body['data']['user']);
      String token=response.body['data']['token'];
      await AuthController.saveUserData(token, userModel);
      _errorMassage = null;
      isSuccess = true;
    } else {
      _errorMassage = response.errorMassage;
    }
    _verifyOtpInProgress=false;
    notifyListeners();

    return isSuccess;
  }
}
