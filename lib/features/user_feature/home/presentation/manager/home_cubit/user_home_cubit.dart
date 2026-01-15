import 'dart:async';
import 'dart:developer';

import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/request_state_enum.dart';
import '../../../../../../core/network/check_network_connection.dart';
import '../../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../../data/model/slider_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit({required this.userHomeRepo}) : super(const UserHomeState());
  final UserHomeRepo userHomeRepo;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void emit(UserHomeState state) {
    log("isClosed : $isClosed");
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    log(
      "---------------------------------------------------------subscription cancelled",
    );
    return super.close();
  }

  void init() async {
    if (!await isThereNetworkConnection()) {
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );

      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        log(
          "---------------------------------------------------------subscription opened",
        );
        if (!result.contains(ConnectivityResult.none)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
          );
          log(
            "-----------------------------------------------------load all data",
          );
          loadAllData();
        }
      });
    } else {
      loadAllData();
    }
  }

  void loadAllData() {
    _subscription?.cancel();
    log(
      "---------------------------------------------------------subscription cancelled",
    );
    loadSliders();
    loadMerchantCategories();
  }

  Future<void> loadSliders() async {
    emit(state.copyWith(sliderRequestState: RequestStateEnum.loading));
    final result = await userHomeRepo.getSliders();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            sliderRequestState: RequestStateEnum.failure,
            errMessage: failure.errMessage,
          ),
        );
      },
      (sliders) {
        // _subscription?.cancel();
        emit(
          state.copyWith(
            sliderRequestState: RequestStateEnum.success,
            sliderList: sliders,
          ),
        );
      },
    );
  }

  Future<void> loadMerchantCategories() async {
    emit(
      state.copyWith(merchantCategoriesRequestState: RequestStateEnum.loading),
    );
    final result = await userHomeRepo.getMerchantCategories();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            merchantCategoriesRequestState: RequestStateEnum.failure,
            errMessage: failure.errMessage,
          ),
        );
      },
      (merchantCategories) {
        emit(
          state.copyWith(
            merchantCategoriesRequestState: RequestStateEnum.success,
            merchantCategoryList: merchantCategories,
          ),
        );
      },
    );
  }
}
