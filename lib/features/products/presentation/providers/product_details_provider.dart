
import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/model/product_details_mobel.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _getProductDetailsInProgress = false;

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetailsModel? _productDetailsModel;

  ProductDetailsModel? get productDetailsModel => _productDetailsModel;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;

    _getProductDetailsInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.productDetailsUrl(productId),
    );
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(
        response.body['data'],
      );
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage;
    }

    _getProductDetailsInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}