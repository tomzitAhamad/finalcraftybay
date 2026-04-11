import 'package:flutter/foundation.dart';

import '../../../app/network_caller_set_up.dart';
import '../../../app/urls.dart';
import '../../../core/services/network_caller.dart';
import '../data/model/wish_list_model.dart';

class WishListProvider extends ChangeNotifier {
  bool _getWishListInProgress = false;
  bool get getWishListInProgress => _getWishListInProgress;

  List<WishListModel> _wishList = [];
  List<WishListModel> get wishList => _wishList;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getWishList() async {
    bool isSuccess = false;

    _getWishListInProgress = true;
    notifyListeners();

    final NetworkResponse response =
    await getNetworkCaller().getRequest(Urls.wishListUrl);

    if (response.isSuccess) {
      List data = response.body['data']['results'];

      _wishList = data
          .map((e) => WishListModel.fromJson(e))
          .toList();

      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage;
    }

    _getWishListInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}