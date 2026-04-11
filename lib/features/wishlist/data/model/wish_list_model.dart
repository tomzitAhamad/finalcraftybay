import '../../../products/data/model/product_model.dart';

class WishListModel {
  final String id;
  final String user;
  final ProductModel product;

  WishListModel({
    required this.id,
    required this.user,
    required this.product,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      product: ProductModel.fromJson(json['product'] ?? {}),
    );
  }
}