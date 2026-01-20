import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/user_order_param.dart';
import '../../data/models/user_order_model.dart';
import '../repo/user_order_repo.dart';

class GetUserOrdersUseCase {
  final UserOrderRepo userOrderRepo;

  GetUserOrdersUseCase({required this.userOrderRepo});

  Future<Either<Failure, List<UserOrderModel>>> call(
    UserOrderParam param,
  ) async {
    return await userOrderRepo.getUserOrders(param: param);
  }
}
