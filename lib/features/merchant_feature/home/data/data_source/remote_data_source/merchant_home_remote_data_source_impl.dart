import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';

import '../../../../../../core/api/api_keys.dart';
import '../../models/order_item_model/order_item_model.dart';
import 'merchant_home_remote_data_source.dart';

class MerchantHomeRemoteDataSourceImpl extends MerchantHomeRemoteDataSource {
  final ApiConsumer apiConsumer;
  MerchantHomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<MerchantOrderItemModel>> fetchOrders({
    required int skip,
    required int status,
  }) async {
    var body = await apiConsumer.get(
      EndPoint.orders,
      queryParameters: {
        ApiKeys.merchant: SharedPreferenceSingleton.getString(ApiKeys.userId),
        ApiKeys.skip: skip,
        ApiKeys.status: status,
      },
    );
    List<MerchantOrderItemModel> orders = [];
    for (var order in body) {
      orders.add(MerchantOrderItemModel.fromJson(order));
    }
    return orders;
  }
}
