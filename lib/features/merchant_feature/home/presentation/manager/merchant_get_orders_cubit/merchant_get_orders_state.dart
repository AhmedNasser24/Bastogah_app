part of 'merchant_get_orders_cubit.dart';

class MerchantGetOrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetOrdersInitial extends MerchantGetOrdersState {}

class GetOrdersLoading extends MerchantGetOrdersState {}

class GetOrdersSuccessFull extends MerchantGetOrdersState {
  final List<MerchantOrderItemModel> orders;
  final bool moreItem;
  final int currentStatus;
  GetOrdersSuccessFull({
    required this.orders,
    required this.moreItem,
    required this.currentStatus,
  });

  @override
  List<Object?> get props => [orders, moreItem, currentStatus];
}

class GetOrdersFailure extends MerchantGetOrdersState {
  final String errorMessage;
  GetOrdersFailure({required this.errorMessage});
}
