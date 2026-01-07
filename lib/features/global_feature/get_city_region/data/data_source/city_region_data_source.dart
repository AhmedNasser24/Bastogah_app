import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/region_model.dart';

abstract class CityRegionDataSource {
  Future<List<CityModel>> getCities({required String regionId});
  Future<List<RegionModel>> getRegions();
}
