import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/region_model.dart';

abstract class CityRegionRepo {
  Future<Either<Failure, List<CityModel>>> getCities({
    required String regionId,
  });
  Future<Either<Failure, List<RegionModel>>> getRegions();
}
