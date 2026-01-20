import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/user_order_param.dart';
import '../../data/models/user_order_model.dart';

abstract class UserOrderRepo {
  Future<Either<Failure, List<UserOrderModel>>> getUserOrders({
    required UserOrderParam param,
  });
}
