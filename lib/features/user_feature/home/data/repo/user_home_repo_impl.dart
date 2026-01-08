import 'package:bastogah_app/core/errors/failure.dart';
import 'package:bastogah_app/features/user_feature/home/data/data_source/user_home_data_source.dart';

import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repo/user_home_repo.dart';

class UserHomeRepoImpl implements UserHomeRepo {
  final UserHomeDataSource userHomeDataSource;

  UserHomeRepoImpl({required this.userHomeDataSource});
  @override
  Future<Either<Failure, List<SliderModel>>> getSliders() async {
    try {
      final sliders = await userHomeDataSource.getSliders();
      return Right(sliders);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }
}
