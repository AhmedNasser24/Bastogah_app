part of 'user_order_cubit.dart';

class UserOrderState extends Equatable {
  const UserOrderState({
    this.orderState = RequestStateEnum.initial,
    this.orderList = const [],
    this.errMessage = "",
    this.moreItem = false,
  });
  final RequestStateEnum orderState;
  final List<UserOrderModel> orderList;
  final String errMessage;
  final bool moreItem;
  UserOrderState copyWith({
    RequestStateEnum? orderState,
    List<UserOrderModel>? orderList,
    String? errMessage,
    bool? moreItem,
  }) {
    return UserOrderState(
      orderState: orderState ?? this.orderState,
      orderList: orderList ?? this.orderList,
      errMessage: errMessage ?? this.errMessage,
      moreItem: moreItem ?? this.moreItem,
    );
  }

  @override
  List<Object> get props => [orderState, orderList, errMessage, moreItem];
}
