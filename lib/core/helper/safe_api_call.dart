import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../errors/failure.dart';

Future<Either<Failure, T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (e) {
    return Left(ServerFailure.fromDioException(e));
  } catch (e) {
    return Left(ServerFailure.defaultFailure(e.toString()));
  }
}
