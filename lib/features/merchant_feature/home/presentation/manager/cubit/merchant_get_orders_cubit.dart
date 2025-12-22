import 'dart:developer';

import 'package:bastogah_app/core/enums/merchant_filter_enums.dart';
import 'package:bastogah_app/features/merchant_feature/home/domain/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_item_model/order_item_model.dart';

part 'merchant_get_orders_state.dart';

class MerchantGetOrdersCubit extends Cubit<MerchantGetOrdersState> {
  MerchantGetOrdersCubit({required this.homeRepo}) : super(GetOrdersInitial());
  final MerchantHomeRepo homeRepo;

  int currentStatus = MerchantFilterEnum.pending.status;
  int _skip = 0;
  bool moreItem = true;
  final int maxItem = 20;
  List<MerchantOrderItemModel> _orders = [];

  void fetchOrders({required int status}) async {
    _skip = 0;
    moreItem = true;
    _orders.clear();

    emit(GetOrdersLoading());
    log("loading");
    currentStatus = status;
    var result = await homeRepo.fetchOrders(skip: _skip, status: status);
    result.fold(
      (failure) => emit(GetOrdersFailure(errorMessage: failure.errMessage)),
      (orders) {
        moreItem = orders.length == maxItem;
        _orders = orders;
        if (moreItem) {
          _skip += 20;
        }
        log(orders.toString());
        emit(GetOrdersSuccessFull(orders: _orders));
      },
    );
  }

  void getMoreOrders() async {
    if (!moreItem) return;
    var result = await homeRepo.fetchOrders(skip: _skip, status: currentStatus);
    result.fold(
      (failure) => emit(GetOrdersFailure(errorMessage: failure.errMessage)),
      (orders) {
        moreItem = orders.length == maxItem;
        _orders.addAll(orders);
        if (moreItem) {
          _skip += 20;
        }
        emit(GetOrdersSuccessFull(orders: _orders));
      },
    );
  }

  void refresh() {
    fetchOrders(status: currentStatus);
  }
}
