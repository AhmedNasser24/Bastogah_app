import 'package:bastogah_app/core/api/dio_consumer.dart';
import 'package:bastogah_app/core/api/end_points.dart';
import 'package:bastogah_app/features/merchant_feature/auth/data/remote_data_source/merchant_auth.dart';

class MerchantAuthImpl extends MerchantAuth {
  final DioConsumer dioConsumer;
  MerchantAuthImpl({required this.dioConsumer});
  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    var body = await dioConsumer.post(
      EndPoints.merchantLogin,
      body: {"username": username, "password": password},
    );
    return body;
  }
}
