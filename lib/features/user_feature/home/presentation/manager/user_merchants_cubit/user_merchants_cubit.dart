import 'dart:async';
import 'dart:developer';

import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/request_state_enum.dart';
import '../../../../../../core/network/check_network_connection.dart';
import '../../../data/model/user_merchant_model.dart';
import '../../../data/params/user_merchant_param.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'user_merchants_state.dart';

class UserMerchantsCubit extends Cubit<UserMerchantsState> {
  UserMerchantsCubit({required this.userHomeRepo})
    : super(const UserMerchantsState());
  final UserHomeRepo userHomeRepo;

  int _skip = 0;
  bool moreItem = true;
  int maxItem = 20;
  List<UserMerchantModel> merchants = [];
  bool isLoadingMore = false;
  bool isFirstOperation = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void emit(UserMerchantsState state) {
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

  void init({required UserMerchantParam userMerchantParam}) async {
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
          loadAllData(userMerchantParam: userMerchantParam);
        }
      });
    } else {
      loadAllData(userMerchantParam: userMerchantParam);
    }
  }

  void loadAllData({required UserMerchantParam userMerchantParam}) {
    _subscription?.cancel();
    log(
      "---------------------------------------------------------subscription cancelled",
    );
    loadMerchants(userMerchantParam: userMerchantParam);
  }

  void loadMerchants({required UserMerchantParam userMerchantParam}) async {
    _skip = 0;
    moreItem = true;
    merchants.clear();

    emit(state.copyWith(userMerchantsRequestState: RequestStateEnum.loading));
    userMerchantParam.skip = _skip;
    var result = await userHomeRepo.getMerchants(
      userMerchantParam: userMerchantParam,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          userMerchantsRequestState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (merchants) {
        moreItem = merchants.length == maxItem;
        this.merchants = merchants;
        if (moreItem) {
          _skip += 20;
        }
        isFirstOperation = false;
        emit(
          state.copyWith(
            userMerchantsRequestState: RequestStateEnum.success,
            merchants: this.merchants,
            moreItem: moreItem,
            isFirstOperation: isFirstOperation,
          ),
        );
      },
    );
  }

  void loadMoreMerchants({required UserMerchantParam userMerchantParam}) async {
    if (!moreItem) return;
    isLoadingMore = true;
    var result = await userHomeRepo.getMerchants(
      userMerchantParam: userMerchantParam,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          userMerchantsRequestState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (merchants) {
        moreItem = merchants.length == maxItem;
        this.merchants.addAll(merchants);
        if (moreItem) {
          _skip += 20;
        }
        emit(
          state.copyWith(
            userMerchantsRequestState: RequestStateEnum.success,
            merchants: this.merchants,
            moreItem: moreItem,
            isLoadingMore: isLoadingMore,
          ),
        );
      },
    );
    isLoadingMore = false;
  }

  void refresh({required UserMerchantParam userMerchantParam}) async {
    if (!await isThereNetworkConnection()) {
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }
    isFirstOperation = true;
    loadMerchants(userMerchantParam: userMerchantParam);
  }
}
