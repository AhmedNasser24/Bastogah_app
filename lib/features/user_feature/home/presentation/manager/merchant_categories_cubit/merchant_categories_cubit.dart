import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/check_network_connection.dart';
import '../../../data/model/merchant_category_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'merchant_categories_state.dart';

class MerchantCategoriesCubit extends Cubit<MerchantCategoriesState> {
  MerchantCategoriesCubit({required this.userHomeRepo})
    : super(MerchantCategoriesInitial());

  final UserHomeRepo userHomeRepo;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<void> getMerchantCategories() async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          // CustomToastification.showSuccessToast(             make this message in one end point in each page , and it made in slider_cubit
          //   message: "internet_connection_restored".tr(),
          // );
          getMerchantCategories();
        }
      });
      return;
    }
    emit(MerchantCategoriesLoading());
    final result = await userHomeRepo.getMerchantCategories();
    result.fold(
      (failure) {
        emit(MerchantCategoriesFailure(errMessage: failure.errMessage));
      },
      (merchantCategories) {
        _subscription?.cancel();
        emit(MerchantCategoriesSuccess(merchantCategories: merchantCategories));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
