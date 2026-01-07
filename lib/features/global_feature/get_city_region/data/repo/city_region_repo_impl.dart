import 'package:bastogah_app/core/errors/failure.dart';

import 'package:bastogah_app/core/models/city_model.dart';

import 'package:bastogah_app/core/models/region_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repo/city_region_repo.dart';
import '../data_source/city_region_data_source.dart';

class CityRegionRepoImpl implements CityRegionRepo {
  final CityRegionDataSource cityRegionDataSource;

  CityRegionRepoImpl({required this.cityRegionDataSource});
  @override
  Future<Either<Failure, List<RegionModel>>> getRegions() async {
    try {
      final regions = await cityRegionDataSource.getRegions();
      return Right(regions);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> getCities({
    required String regionId,
  }) async {
    try {
      final cities = await cityRegionDataSource.getCities(regionId: regionId);
      return Right(cities);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure.defaultFailure(e.toString()));
    }
  }
}
