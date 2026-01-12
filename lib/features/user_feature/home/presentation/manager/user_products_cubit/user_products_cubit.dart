import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/check_network_connection.dart';
import '../../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../../data/model/user_product_model.dart';
import '../../../data/params/user_product_param.dart';
import '../../../domain/repo/user_home_repo.dart';
part 'user_products_state.dart';

class UserProductsCubit extends Cubit<UserProductsState> {
  UserProductsCubit({required this.userHomeRepo})
    : super(UserProductsInitial());
  final UserHomeRepo userHomeRepo;

  int _skip = 0;
  bool moreItem = true;
  int maxItem = 20;
  List<UserProductModel> products = [];
  bool isLoadingMore = false;
  bool isFirstOperation = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  void fetchProducts({required UserProductParam userProductParam}) async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
          );
          fetchProducts(userProductParam: userProductParam);
        }
      });
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }

    _skip = 0;
    moreItem = true;
    products.clear();

    emit(UserProductsLoading());
    userProductParam.skip = _skip;
    var result = await userHomeRepo.getProducts(
      userProductParam: userProductParam,
    );
    result.fold(
      (failure) => emit(UserProductsFailure(errorMessage: failure.errMessage)),
      (products) {
        moreItem = products.length == maxItem;
        this.products = products;
        if (moreItem) {
          _skip += 20;
        }
        _subscription?.cancel();
        isFirstOperation = false;
        emit(
          UserProductsSuccessFull(products: this.products, moreItem: moreItem),
        );
      },
    );
  }

  void fetchMoreProducts({required UserProductParam userProductParam}) async {
    if (!moreItem) return;
    isLoadingMore = true;
    var result = await userHomeRepo.getProducts(
      userProductParam: userProductParam,
    );
    result.fold(
      (failure) => emit(UserProductsFailure(errorMessage: failure.errMessage)),
      (products) {
        moreItem = products.length == maxItem;
        this.products.addAll(products);
        if (moreItem) {
          _skip += 20;
        }
        emit(
          UserProductsSuccessFull(products: this.products, moreItem: moreItem),
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
    }
    isFirstOperation = true;
    fetchProducts(userProductParam: userProductParam);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
