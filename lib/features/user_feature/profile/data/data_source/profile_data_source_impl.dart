import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:bastogah_app/features/user_feature/profile/data/data_source/profile_data_source.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/end_point.dart';
import '../../../../../core/local_storage_services/shared_preference_singleton.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final ApiConsumer apiConsumer;
  ProfileDataSourceImpl({required this.apiConsumer});
  @override
  Future<Map<String, dynamic>> getProfile() async {
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
