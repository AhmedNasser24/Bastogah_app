import 'package:bastogah_app/features/merchant_feature/home/data/data_source/remote_data_source/merchant_home_remote_data_source.dart';
import 'package:bastogah_app/features/merchant_feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../models/order_item_model/order_item_model.dart';

class MerchantHomeRepoImpl implements MerchantHomeRepo {
  final MerchantHomeRemoteDataSource merchantHomeRemoteDataSource;

  const MerchantHomeRepoImpl({required this.merchantHomeRemoteDataSource});

  @override
  Future<Either<Failure, List<MerchantOrderItemModel>>> fetchOrders({
    required int skip,
    required int status,
  }) async {
    try {
      final orders = await merchantHomeRemoteDataSource.fetchOrders(
        skip: skip,
        status: status,
      );
      return Right(orders);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }
}
