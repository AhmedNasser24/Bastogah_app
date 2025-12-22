class EndPoint {
  static const String baseUrl = "http://209.250.237.58:4069"; // virtual server
  // static const String baseUrl = "http://209.250.237.58:4069";      // live server

  // -----------------------------------------------------------------------------------
  static const String refreshToken = "/auth/refresh-token";
  // Merchant End Points
  static const String merchantLogin = "/auth/login";
  static const String merchantGetOrders = "/orders";
}
