class EndPoint {
  static const String baseUrl = "http://209.250.237.58:4069"; // virtual server
  // static const String baseUrl = "http://209.250.237.58:4069";      // live server
  static const String imageBaseUrl = "$baseUrl/images/";

  // -----------------------------------------------------------------------------------

  // common End Points

  static const String refreshToken = "/auth/refresh-token";
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String profile = "/auth/profile";
  static const String regions = "/regions";
  static const String cities = "/cities";

  // user End Points
  static const String sliders = "/sliders";
  static const String merchantCategories = "/merchant-categories";
  static const String merchants = "/users/merchants";
  static const String products = "/products";

  // Merchant End Points
  static const String orders = "/orders";
}
