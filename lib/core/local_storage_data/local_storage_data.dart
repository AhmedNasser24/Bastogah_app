import 'dart:convert';
import 'dart:developer';

import 'package:bastogah_app/core/constant/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:bastogah_app/features/user_feature/cart/data/model/cart_model.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/user_merchant_model.dart';
import 'package:bastogah_app/features/user_feature/profile/data/model/profile_model.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalStorageData {
  static ProfileModel getProfile() {
    final profileData = SharedPreferenceSingleton.getString(kProfileDataKey);
    return ProfileModel.fromJson(jsonDecode(profileData));
  }

  static void setProfile(Map<String, dynamic> jsonData) {
    SharedPreferenceSingleton.setString(kProfileDataKey, jsonEncode(jsonData));
  }

  static ValueNotifier<List<UserMerchantModel>> favouriteListNotifier =
      ValueNotifier(getFavourites());

  static Future<void> addFavourite(UserMerchantModel merchant) async {
    final favourites = getFavourites();

    final exists = favourites.any((e) => e.id == merchant.id);
    if (exists) return;

    favourites.add(merchant);

    await SharedPreferenceSingleton.setString(
      kFavouriteDataKey,
      jsonEncode(UserMerchantModel.toJsonList(favourites)),
    );
    favouriteListNotifier.value = favourites;
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

  static Future<void> removeFavouriteItem(String id) async {
    List<UserMerchantModel> favourites = getFavourites();
    favourites.removeWhere((element) => element.id == id);
    await SharedPreferenceSingleton.setString(
      kFavouriteDataKey,
      jsonEncode(UserMerchantModel.toJsonList(favourites)),
    );
    favouriteListNotifier.value = favourites;
    log("remove favourite");
  }

  static Future<void> addToCart(CartModel cartProduct) async {
    final cart = getCart();
    final bool exist = isProductInCart(cartProduct.userProduct.id!);
    if (exist) {
      CustomToastification.showNotificationToast(
        message: "Product already exists in cart".tr(),
      );
      return;
    }
    cart.add(cartProduct);
    await SharedPreferenceSingleton.setString(
      kCartDataKey,
      jsonEncode(CartModel.toJsonList(cart)),
    );
    log("set cart");
  }

  static Future<void> updateCartItemQuantity(CartModel cartProduct) async {
    final cart = getCart();

    final index = cart.indexWhere(
      (e) => e.userProduct.id == cartProduct.userProduct.id,
    );
    if (index != -1) {
      cart[index] = cartProduct; // to update quantity
    }
    await SharedPreferenceSingleton.setString(
      kCartDataKey,
      jsonEncode(CartModel.toJsonList(cart)),
    );
  }

  static List<CartModel> getCart() {
    final data = SharedPreferenceSingleton.getString(kCartDataKey);
    if (data.isEmpty) return [];

    try {
      return CartModel.fromJsonList(jsonDecode(data));
    } catch (e) {
      return [];
    }
  }

  static Future<void> removeCartItem(String id) async {
    List<CartModel> cart = getCart();
    cart.removeWhere((element) => element.userProduct.id == id);
    await SharedPreferenceSingleton.setString(
      kCartDataKey,
      jsonEncode(CartModel.toJsonList(cart)),
    );
    log("remove cart");
  }

  static bool isProductInCart(String id) {
    final cart = getCart();
    return cart.any((e) => e.userProduct.id == id);
  }
}
