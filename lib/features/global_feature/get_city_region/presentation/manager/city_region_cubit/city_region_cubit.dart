import 'dart:async';

import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:bastogah_app/core/network/check_network_connection.dart';
import 'package:bastogah_app/features/global_feature/get_city_region/domain/repo/city_region_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/models/city_model.dart';
import '../../../../../../core/models/region_model.dart';

part 'city_region_state.dart';

class CityRegionCubit extends Cubit<CityRegionState> {
  final CityRegionRepo cityRegionRepo;

  CityRegionCubit({required this.cityRegionRepo}) : super(CityRegionInitial());
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Future<void> fetchRegions() async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((
        List<ConnectivityResult> result,
      ) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          CustomFlutterToast.showSuccessToast(
            "internet_connection_restored".tr(),
          );
          fetchRegions();
        }
      });
      return;
    }
    emit(CityRegionLoading());
    final result = await cityRegionRepo.getRegions();
    result.fold(
      (failure) {
        emit(CityRegionFailure(message: failure.errMessage));
      },
      (fetchedRegions) {
        _subscription?.cancel();
        emit(FetchRegionsSuccess(regions: fetchedRegions));
      },
    );
  }

  Future<void> fetchCities({required String regionId}) async {
    if (!await isThereNetworkConnection()) {
      emit(NoInternetConnectionState());
      return;
    }
    emit(CityRegionLoading());
    final result = await cityRegionRepo.getCities(regionId: regionId);
    result.fold(
      (failure) {
        emit(CityRegionFailure(message: failure.errMessage));
      },
      (fetchedCities) {
        emit(FetchCitiesSuccess(cities: fetchedCities));
      },
    );
  }
}
