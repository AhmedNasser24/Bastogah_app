import 'dart:async';
import 'dart:developer';

import 'package:bastogah_app/core/enums/request_state_enum.dart';
import 'package:bastogah_app/features/user_feature/my_order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/check_network_connection.dart';
import '../../../../../../core/params/user_order_param.dart';
import '../../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../../data/models/user_order_model.dart';

part 'user_order_state.dart';

class UserOrderCubit extends Cubit<UserOrderState> {
  UserOrderCubit({required this.getUserOrdersUseCase})
    : super(const UserOrderState());

  final GetUserOrdersUseCase getUserOrdersUseCase;

  int _skip = 0;
  bool moreItem = true;
  int maxItem = 20;
  final List<UserOrderModel> _orderList = [];
  bool isLoadingMore = false;
  bool isFirstOperation = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  final UserOrderParam _userOrderParam = UserOrderParam();

  @override
  void emit(UserOrderState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  void init() async {
    if (!await isThereNetworkConnection()) {
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );

      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (!result.contains(ConnectivityResult.none)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
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
    loadOrders();
  }

  void loadOrders() async {
    _skip = 0;
    moreItem = true;
    _orderList.clear();

    emit(state.copyWith(orderState: RequestStateEnum.loading));
    _userOrderParam.skip = _skip;
    var result = await getUserOrdersUseCase.call(_userOrderParam);
    result.fold(
      (failure) => emit(
        state.copyWith(
          orderState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (orderList) {
        moreItem = orderList.length == maxItem;
        _orderList.addAll(orderList);

        if (moreItem) {
          _skip += 20;
          _userOrderParam.skip = _skip;
        }
        isFirstOperation = false;
        emit(
          state.copyWith(
            orderState: RequestStateEnum.success,
            orderList: _orderList,
            moreItem: moreItem,
          ),
        );
      },
    );
  }

  void loadMoreOrders() async {
    if (!moreItem ||
        isLoadingMore ||
        state.orderState == RequestStateEnum.loading ||
        state.orderState == RequestStateEnum.loadingMore) {
      return;
    }
    emit(state.copyWith(orderState: RequestStateEnum.loadingMore));
    isLoadingMore = true;
    log(
      "--------------------------------------skip $_skip--------------------------------------",
    );
    log(
      "--------------------------------------_userOrderParam.skip ${_userOrderParam.skip}--------------------------------------",
    );
    var result = await getUserOrdersUseCase.call(_userOrderParam);
    result.fold(
      (failure) => emit(
        state.copyWith(
          orderState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (orderList) {
        moreItem = orderList.length == maxItem;
        _orderList.addAll(orderList);
        if (moreItem) {
          _skip += 20;
          _userOrderParam.skip = _skip;
        }
        emit(
          state.copyWith(
            orderState: RequestStateEnum.success,
            orderList: _orderList,
            moreItem: moreItem,
          ),
        );
      },
    );
    isLoadingMore = false;
  }

  void refresh() async {
    if (!await isThereNetworkConnection()) {
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }
    isFirstOperation = true;
    loadOrders();
  }
}
