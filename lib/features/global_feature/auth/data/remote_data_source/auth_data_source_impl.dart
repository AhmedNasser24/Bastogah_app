import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/features/global_feature/auth/data/remote_data_source/auth_data_source.dart';

import '../../../../../core/api/api_consumer.dart';

class AuthDataSourceImpl implements AuthDataSource {
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

  @override
  Future<Map<String, dynamic>> fetchProfileData() async {
    var body = await apiConsumer.get(
      EndPoint.profile,
      headers: {
        "Authorization":
            "Bearer ${SharedPreferenceSingleton.getString(ApiKeys.accessToken)}",
      },
    );
    return body;
  }
}
