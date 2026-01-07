import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/core/models/city_model.dart';

import 'package:bastogah_app/core/models/region_model.dart';

import 'city_region_data_source.dart';

class CityRegionDataSourceImpl implements CityRegionDataSource {
  final ApiConsumer apiConsumer;
  const CityRegionDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<RegionModel>> getRegions() async {
    List<dynamic> jsonList = await apiConsumer.get(EndPoint.regions);
    return RegionModel.fromJsonList(jsonList);
  }

  @override
  Future<List<CityModel>> getCities({required String regionId}) async {
    List<dynamic> jsonList = await apiConsumer.get(
      EndPoint.cities,
      queryParameters: {"region": regionId},
    );
    return CityModel.fromJsonList(jsonList);
  }
}
