import 'package:bastogah_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/order_item_model/order_item_model.dart';

abstract class MerchantHomeRepo {
  Future<Either<Failure, List<MerchantOrderItemModel>>> fetchOrders({
    required int skip,
    required int status,
  });
}
