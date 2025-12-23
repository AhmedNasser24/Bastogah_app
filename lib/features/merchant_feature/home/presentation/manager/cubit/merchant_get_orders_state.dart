part of 'merchant_get_orders_cubit.dart';

class MerchantGetOrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetOrdersInitial extends MerchantGetOrdersState {}

class GetOrdersLoading extends MerchantGetOrdersState {}

class GetOrdersSuccessFull extends MerchantGetOrdersState {
  final List<MerchantOrderItemModel> orders;
  GetOrdersSuccessFull({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class GetOrdersFailure extends MerchantGetOrdersState {
  final String errorMessage;
  GetOrdersFailure({required this.errorMessage});
}
