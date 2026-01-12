import 'dart:convert';

import 'package:bastogah_app/core/constant/constants.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/features/user_feature/profile/data/model/profile_model.dart';

class LocalStorageData {
  static ProfileModel getProfile() {
    final profileData = SharedPreferenceSingleton.getString(kProfileDataKey);
    return ProfileModel.fromJson(jsonDecode(profileData));
  }

  static void setProfile(Map<String, dynamic> jsonData) {
    SharedPreferenceSingleton.setString(kProfileDataKey, jsonEncode(jsonData));
  }
}
