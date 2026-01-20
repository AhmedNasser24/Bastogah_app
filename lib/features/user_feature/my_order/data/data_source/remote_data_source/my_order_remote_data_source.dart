import 'package:bastogah_app/core/params/user_order_param.dart';

import '../../models/user_order_model.dart';

abstract interface class MyOrderRemoteDataSource {
  Future<List<UserOrderModel>> getUserOrders({required UserOrderParam param});
}
