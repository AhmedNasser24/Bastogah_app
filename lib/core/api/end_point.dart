class EndPoint {
  static const String baseUrl = "http://209.250.237.58:4069"; // virtual server
  // static const String baseUrl = "http://209.250.237.58:4069";      // live server

  // -----------------------------------------------------------------------------------

  // common End Points

  static const String refreshToken = "/auth/refresh-token";
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String regions = "/regions";
  static const String cities = "/cities";

  // Merchant End Points
  static const String merchantGetOrders = "/orders";
}
