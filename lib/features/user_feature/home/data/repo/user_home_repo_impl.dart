import 'package:bastogah_app/core/errors/failure.dart';
import 'package:bastogah_app/features/user_feature/home/data/data_source/user_home_data_source.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';

import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repo/user_home_repo.dart';
import '../model/user_merchant_model.dart';
import '../model/user_product_model.dart';
import '../../../../../core/params/user_merchant_param.dart';
import '../../../../../core/params/user_product_param.dart';

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

  @override
  Future<Either<Failure, List<MerchantCategoryModel>>>
  getMerchantCategories() async {
    try {
      final merchantCategories = await userHomeDataSource
          .getMerchantCategories();
      return Right(merchantCategories);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserMerchantModel>>> getMerchants({
    required UserMerchantParam userMerchantParam,
  }) async {
    try {
      final merchants = await userHomeDataSource.getMerchants(
        userMerchantParam: userMerchantParam,
      );
      return Right(merchants);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserProductModel>>> getProducts({
    required UserProductParam userProductParam,
  }) async {
    try {
      final products = await userHomeDataSource.getProducts(
        userProductParam: userProductParam,
      );
      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }
}
