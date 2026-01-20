import 'dart:async';
import 'dart:developer';

import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/request_state_enum.dart';
import '../../../../../../core/network/check_network_connection.dart';
import '../../../data/model/user_product_model.dart';
import '../../../../../../core/params/user_product_param.dart';
import '../../../domain/repo/user_home_repo.dart';
part 'user_products_state.dart';

class UserProductsCubit extends Cubit<UserProductsState> {
  UserProductsCubit({required this.userHomeRepo})
    : super(const UserProductsState());
  final UserHomeRepo userHomeRepo;

  int _skip = 0;
  bool moreItem = true;
  int maxItem = 20;
  List<UserProductModel> products = [];
  bool isLoadingMore = false;
  bool isFirstOperation = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void emit(UserProductsState state) {
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

  void init({required UserProductParam userProductParam}) async {
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
          loadAllData(userProductParam: userProductParam);
        }
      });
    } else {
      loadAllData(userProductParam: userProductParam);
    }
  }

  void loadAllData({required UserProductParam userProductParam}) {
    _subscription?.cancel();
    log(
      "---------------------------------------------------------subscription cancelled",
    );
    loadProducts(userProductParam: userProductParam);
  }

  void loadProducts({required UserProductParam userProductParam}) async {
    _skip = 0;
    moreItem = true;
    products.clear();

    emit(state.copyWith(userProductsRequestState: RequestStateEnum.loading));
    userProductParam.skip = _skip;
    var result = await userHomeRepo.getProducts(
      userProductParam: userProductParam,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          userProductsRequestState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (products) {
        moreItem = products.length == maxItem;
        this.products = products;
        if (moreItem) {
          _skip += 20;
        }
        isFirstOperation = false;
        emit(
          state.copyWith(
            userProductsRequestState: RequestStateEnum.success,
            products: this.products,
            moreItem: moreItem,
            isFirstOperation: isFirstOperation,
          ),
        );
      },
    );
  }

  void loadMoreProducts({required UserProductParam userProductParam}) async {
    if (!moreItem) return;
    isLoadingMore = true;
    var result = await userHomeRepo.getProducts(
      userProductParam: userProductParam,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          userProductsRequestState: RequestStateEnum.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (products) {
        moreItem = products.length == maxItem;
        this.products.addAll(products);
        if (moreItem) {
          _skip += 20;
        }
        emit(
          state.copyWith(
            userProductsRequestState: RequestStateEnum.success,
            products: this.products,
            moreItem: moreItem,
            isLoadingMore: isLoadingMore,
          ),
        );
      },
    );
    isLoadingMore = false;
  }

  void refresh({required UserProductParam userProductParam}) async {
    if (!await isThereNetworkConnection()) {
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }
    isFirstOperation = true;
    loadProducts(userProductParam: userProductParam);
  }
}
