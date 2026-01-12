import 'dart:async';

import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/check_network_connection.dart';
import '../../../data/model/user_merchant_model.dart';
import '../../../data/params/user_merchant_param.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'user_merchants_state.dart';

class UserMerchantsCubit extends Cubit<UserMerchantsState> {
  UserMerchantsCubit({required this.userHomeRepo})
    : super(UserMerchantsInitial());
  final UserHomeRepo userHomeRepo;

  int _skip = 0;
  bool moreItem = true;
  int maxItem = 20;
  List<UserMerchantModel> merchants = [];
  bool isLoadingMore = false;
  bool isFirstOperation = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  void fetchMerchants({required UserMerchantParam userMerchantParam}) async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
          );
          fetchMerchants(userMerchantParam: userMerchantParam);
        }
      });
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }

    _skip = 0;
    moreItem = true;
    merchants.clear();

    emit(UserMerchantsLoading());
    userMerchantParam.skip = _skip;
    var result = await userHomeRepo.getMerchants(
      userMerchantParam: userMerchantParam,
    );
    result.fold(
      (failure) => emit(UserMerchantsFailure(errorMessage: failure.errMessage)),
      (merchants) {
        moreItem = merchants.length == maxItem;
        this.merchants = merchants;
        if (moreItem) {
          _skip += 20;
        }
        _subscription?.cancel();
        isFirstOperation = false;
        emit(
          UserMerchantsSuccessFull(
            merchants: this.merchants,
            moreItem: moreItem,
          ),
        );
      },
    );
  }

  void fetchMoreMerchants({
    required UserMerchantParam userMerchantParam,
  }) async {
    if (!moreItem) return;
    isLoadingMore = true;
    var result = await userHomeRepo.getMerchants(
      userMerchantParam: userMerchantParam,
    );
    result.fold(
      (failure) => emit(UserMerchantsFailure(errorMessage: failure.errMessage)),
      (merchants) {
        moreItem = merchants.length == maxItem;
        this.merchants.addAll(merchants);
        if (moreItem) {
          _skip += 20;
        }
        emit(
          UserMerchantsSuccessFull(
            merchants: this.merchants,
            moreItem: moreItem,
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
    }
    isFirstOperation = true;
    fetchMerchants(userMerchantParam: userMerchantParam);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
