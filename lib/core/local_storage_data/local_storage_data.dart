import 'dart:convert';
import 'dart:developer';

import 'package:bastogah_app/core/constant/constants.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/user_merchant_model.dart';
import 'package:bastogah_app/features/user_feature/profile/data/model/profile_model.dart';

class LocalStorageData {
  static ProfileModel getProfile() {
    final profileData = SharedPreferenceSingleton.getString(kProfileDataKey);
    return ProfileModel.fromJson(jsonDecode(profileData));
  }

  static void setProfile(Map<String, dynamic> jsonData) {
    SharedPreferenceSingleton.setString(kProfileDataKey, jsonEncode(jsonData));
  }

  static void addFavourite(UserMerchantModel merchant) {
    final favourites = getFavourites();

    final exists = favourites.any((e) => e.id == merchant.id);
    if (exists) return;

    favourites.add(merchant);

    SharedPreferenceSingleton.setString(
      kFavouriteDataKey,
      jsonEncode(UserMerchantModel.toJsonList(favourites)),
    );
    log("set favourite");
  }

  static List<UserMerchantModel> getFavourites() {
    final data = SharedPreferenceSingleton.getString(kFavouriteDataKey);
    if (data.isEmpty) return [];

    try {
      return UserMerchantModel.fromJsonList(jsonDecode(data));
    } catch (e) {
      return [];
    }
  }

  static void removeFavouriteItem(String id) {
    List<UserMerchantModel> favourites = getFavourites();
    favourites.removeWhere((element) => element.id == id);
    SharedPreferenceSingleton.setString(
      kFavouriteDataKey,
      jsonEncode(UserMerchantModel.toJsonList(favourites)),
    );
    log("remove favourite");
  }
}
