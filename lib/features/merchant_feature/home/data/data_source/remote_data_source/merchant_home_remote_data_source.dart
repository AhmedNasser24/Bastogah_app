import 'package:bastogah_app/features/merchant_feature/home/data/models/order_item_model/order_item_model.dart';

abstract class MerchantHomeRemoteDataSource {
  Future<List<MerchantOrderItemModel>> fetchOrders({
    required int skip,
    required int status,
  });
}
