import 'dart:async';

import 'package:bastogah_app/core/network/check_network_connection.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/slider_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit({required this.userHomeRepo}) : super(SlidersInitial());
  final UserHomeRepo userHomeRepo;
  List<SliderModel> sliders = [];
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<void> getSliders() async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
          );
          getSliders();
        }
      });
      return;
    }
    emit(SlidersLoading());
    final result = await userHomeRepo.getSliders();
    result.fold(
      (failure) {
        emit(SlidersFailure(errMessage: failure.errMessage));
      },
      (sliders) {
        this.sliders = sliders;
        _subscription?.cancel();
        emit(SlidersLoadedSuccess(sliders: sliders));
      },
    );
  }
}
