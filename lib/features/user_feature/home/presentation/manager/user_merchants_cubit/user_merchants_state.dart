part of 'user_merchants_cubit.dart';

class UserMerchantsState extends Equatable {
  final List<UserMerchantModel> merchants;
  final bool moreItem;
  final RequestStateEnum userMerchantsRequestState;
  final String errMessage;
  final bool isFirstOperation;
  final bool isLoadingMore;
  const UserMerchantsState({
    this.merchants = const [],
    this.moreItem = true,
    this.userMerchantsRequestState = RequestStateEnum.initial,
    this.errMessage = "",
    this.isFirstOperation = true,
    this.isLoadingMore = false,
  });

  UserMerchantsState copyWith({
    List<UserMerchantModel>? merchants,
    bool? moreItem,
    RequestStateEnum? userMerchantsRequestState,
    String? errMessage,
    bool? isFirstOperation,
    bool? isLoadingMore,
  }) {
    return UserMerchantsState(
      merchants: merchants ?? this.merchants,
      moreItem: moreItem ?? this.moreItem,
      userMerchantsRequestState:
          userMerchantsRequestState ?? this.userMerchantsRequestState,
      errMessage: errMessage ?? this.errMessage,
      isFirstOperation: isFirstOperation ?? this.isFirstOperation,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    merchants,
    moreItem,
    userMerchantsRequestState,
    errMessage,
    isFirstOperation,
    isLoadingMore,
  ];
}
