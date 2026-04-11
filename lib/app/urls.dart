class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String signInUrl = '$_baseUrl/auth/login';
  static const String addToCartUrl = '$_baseUrl/cart';
  static const String homeSlidersUrl = '$_baseUrl/slides';
  static const String wishListUrl = '$_baseUrl/wishlist';
  static String categoryListUrl(int pageNumber, int pageSize) =>
      '$_baseUrl/categories?count=$pageSize&page=$pageNumber';

  static String productListUrl(int pageNumber, int pageSize,String categoryId) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNumber&category=$categoryId';
  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';
}
