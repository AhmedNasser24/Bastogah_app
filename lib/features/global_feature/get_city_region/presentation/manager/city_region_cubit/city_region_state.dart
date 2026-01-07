part of 'city_region_cubit.dart';

abstract class CityRegionState extends Equatable {
  const CityRegionState();

  @override
  List<Object> get props => [];
}

class CityRegionInitial extends CityRegionState {}

class CityRegionLoading extends CityRegionState {}

class FetchCitiesSuccess extends CityRegionState {
  final List<CityModel> cities;
  const FetchCitiesSuccess({required this.cities});
  @override
  List<Object> get props => [cities];
}

class FetchRegionsSuccess extends CityRegionState {
  final List<RegionModel> regions;
  const FetchRegionsSuccess({required this.regions});
  @override
  List<Object> get props => [regions];
}

class CityRegionFailure extends CityRegionState {
  final String message;
  const CityRegionFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class NoInternetConnectionState extends CityRegionState {}
