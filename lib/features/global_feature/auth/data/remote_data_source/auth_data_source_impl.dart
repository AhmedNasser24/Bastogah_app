import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/features/global_feature/auth/data/remote_data_source/auth_data_source.dart';

import '../../../../../core/api/api_consumer.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final ApiConsumer apiConsumer;
  AuthDataSourceImpl({required this.apiConsumer});
  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    var body = await apiConsumer.post(
      EndPoint.login,
      body: {"username": username, "password": password},
    );
    return body;
  }
}
