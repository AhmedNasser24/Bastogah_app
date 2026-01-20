import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

import '../model/user_merchant_model.dart';
import '../model/user_product_model.dart';
import '../../../../../core/params/user_merchant_param.dart';
import '../../../../../core/params/user_product_param.dart';
import 'user_home_data_source.dart';

class UserHomeDataSourceImpl implements UserHomeDataSource {
  final ApiConsumer apiConsumer;

  UserHomeDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<SliderModel>> getSliders() async {
    var dataList = await apiConsumer.get(EndPoint.sliders);
    return SliderModel.fromJsonList(dataList);
  }

  @override
  Future<List<MerchantCategoryModel>> getMerchantCategories() async {
    var dataList = await apiConsumer.get(EndPoint.merchantCategories);
    return MerchantCategoryModel.fromJsonList(dataList);
  }

  @override
  Future<List<UserMerchantModel>> getMerchants({
    required UserMerchantParam userMerchantParam,
  }) async {
    String token = SharedPreferenceSingleton.getString(ApiKeys.accessToken);
    var dataList = await apiConsumer.get(
      EndPoint.merchants,
      queryParameters: userMerchantParam.toQueryParameters(),
      headers: {"Authorization": "Bearer $token"},
    );
    return UserMerchantModel.fromJsonList(dataList);
  }

  @override
  Future<List<UserProductModel>> getProducts({
    required UserProductParam userProductParam,
  }) async {
    String token = SharedPreferenceSingleton.getString(ApiKeys.accessToken);
    var dataList = await apiConsumer.get(
      EndPoint.products,
      queryParameters: userProductParam.toQueryParameters(),
      headers: {"Authorization": "Bearer $token"},
    );
    return UserProductModel.fromJsonList(dataList);
  }
}
