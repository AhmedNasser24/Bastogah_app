part of 'merchant_get_orders_cubit.dart';

abstract class MerchantGetOrdersState {}

class GetOrdersInitial extends MerchantGetOrdersState {}

class GetOrdersLoading extends MerchantGetOrdersState {}

class GetOrdersSuccessFull extends MerchantGetOrdersState {
  final List<MerchantOrderItemModel> orders;
  GetOrdersSuccessFull({required this.orders});
}

class GetOrdersFailure extends MerchantGetOrdersState {
  final String errorMessage;
  GetOrdersFailure({required this.errorMessage});
}
