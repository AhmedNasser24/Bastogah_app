import 'package:bastogah_app/core/helper/safe_api_call.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/user_order_param.dart';
import '../../domain/repo/user_order_repo.dart';
import '../data_source/remote_data_source/my_order_remote_data_source.dart';
import '../models/user_order_model.dart';

class UserOrderRepoImpl implements UserOrderRepo {
  final MyOrderRemoteDataSource remoteDataSource;

  UserOrderRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserOrderModel>>> getUserOrders({
    required UserOrderParam param,
  }) {
    return safeApiCall<List<UserOrderModel>>(
      () => remoteDataSource.getUserOrders(param: param),
    );
  }
}
