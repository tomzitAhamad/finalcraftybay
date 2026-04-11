import 'package:flutter/foundation.dart';

import '../../../../app/network_caller_set_up.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';

class AddWishListProvider extends ChangeNotifier {

  /// 🔥 Track loading per product
  final Set<String> _loadingProductIds = {};

  Set<String> get loadingProductIds => _loadingProductIds;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToWishList(String productId) async {
    bool isSuccess = false;

    /// ✅ add this product to loading list
    _loadingProductIds.add(productId);
    notifyListeners();

    final NetworkResponse response =
    await getNetworkCaller().postRequest(
      Urls.addToWishListUrl,
      body: {
        "product": productId,
      },
    );

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage;
    }

    /// ✅ remove after API call
    _loadingProductIds.remove(productId);
    notifyListeners();

    return isSuccess;
  }
}