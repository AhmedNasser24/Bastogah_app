abstract class MerchantAuthDataSource {
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  });
}
