import 'dart:async';
import 'dart:developer';

import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/request_state_enum.dart';
import '../../../data/model/slider_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit({required this.userHomeRepo}) : super(const UserHomeState());
  final UserHomeRepo userHomeRepo;
  // StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void emit(UserHomeState state) {
    log("isClosed : $isClosed");
    if (!isClosed) {
      super.emit(state);
    }
  }

  void init() {
    loadAllData();
  }

  void loadAllData() {
    loadSliders();
    // loadMerchantCategories(),
  }

  Future<void> loadSliders() async {
    // if (!await isThereNetworkConnection()) {
    //   _subscription = Connectivity().onConnectivityChanged.listen((result) {
    //     if (result.contains(ConnectivityResult.mobile) ||
    //         result.contains(ConnectivityResult.wifi) ||
    //         result.contains(ConnectivityResult.ethernet)) {
    //       CustomToastification.showSuccessToast(
    //         message: "internet_connection_restored".tr(),
    //       );
    //       getSliders();
    //     }
    //   });
    //   CustomToastification.showFailureToast(
    //     message: "check_your_internet_connection_and_try_again".tr(),
    //   );
    //   return;
    // }
    emit(state.copyWith(sliderRequestState: RequestStateEnum.loading));
    log("loading");
    final result = await userHomeRepo.getSliders();
    result.fold(
      (failure) {
        log("failure");
        emit(
          state.copyWith(
            sliderRequestState: RequestStateEnum.failure,
            errMessage: failure.errMessage,
          ),
        );
      },
      (sliders) {
        // _subscription?.cancel();
        log("success");
        emit(
          state.copyWith(
            sliderRequestState: RequestStateEnum.success,
            sliderList: sliders,
          ),
        );
      },
    );
  }
}
