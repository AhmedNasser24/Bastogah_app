import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';

import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/end_point.dart';
import '../../../../../../core/params/user_order_param.dart';
import '../../models/user_order_model.dart';
import 'my_order_remote_data_source.dart';

class MyOrderRemoteDataSourceImpl implements MyOrderRemoteDataSource {
  final ApiConsumer _apiConsumer;

  MyOrderRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<UserOrderModel>> getUserOrders({
    required UserOrderParam param,
  }) async {
    param.client = SharedPreferenceSingleton.getString(ApiKeys.userId);
    var jsonList = await _apiConsumer.get(
      EndPoint.orders,
      queryParameters: param.toQueryParameters(),
    );
    return UserOrderModel.fromJsonList(jsonList);
  }
}
