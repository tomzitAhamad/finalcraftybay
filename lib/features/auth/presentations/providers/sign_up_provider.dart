
import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/sign_up_params.dart';

class SignUpProvider extends ChangeNotifier {
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;
  String? _errorMassage;
  String? get errorMassage => _errorMassage;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      _errorMassage = null;
      isSuccess = true;
    } else {
      _errorMassage = response.errorMassage;
    }
    _signUpInProgress=false;
    notifyListeners();

    return isSuccess;
  }
}
