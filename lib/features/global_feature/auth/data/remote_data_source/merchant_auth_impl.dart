import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/features/global_feature/auth/data/remote_data_source/merchant_auth.dart';

import '../../../../../core/api/api_consumer.dart';

class MerchantAuthDataSourceImpl extends MerchantAuthDataSource {
  final ApiConsumer apiConsumer;
  MerchantAuthDataSourceImpl({required this.apiConsumer});
  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    var body = await apiConsumer.post(
      EndPoint.merchantLogin,
      body: {"username": username, "password": password},
    );
    return body;
  }
}
