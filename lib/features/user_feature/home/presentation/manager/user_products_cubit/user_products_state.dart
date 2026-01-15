part of 'user_products_cubit.dart';

class UserProductsState extends Equatable {
  final List<UserProductModel> products;
  final bool moreItem;
  final RequestStateEnum userProductsRequestState;
  final String errMessage;
  final bool isFirstOperation;
  final bool isLoadingMore;
  const UserProductsState({
    this.products = const [],
    this.moreItem = true,
    this.userProductsRequestState = RequestStateEnum.initial,
    this.errMessage = "",
    this.isFirstOperation = true,
    this.isLoadingMore = false,
  });

  UserProductsState copyWith({
    List<UserProductModel>? products,
    bool? moreItem,
    RequestStateEnum? userProductsRequestState,
    String? errMessage,
    bool? isFirstOperation,
    bool? isLoadingMore,
  }) {
    return UserProductsState(
      products: products ?? this.products,
      moreItem: moreItem ?? this.moreItem,
      userProductsRequestState:
          userProductsRequestState ?? this.userProductsRequestState,
      errMessage: errMessage ?? this.errMessage,
      isFirstOperation: isFirstOperation ?? this.isFirstOperation,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    products,
    moreItem,
    userProductsRequestState,
    errMessage,
    isFirstOperation,
    isLoadingMore,
  ];
}
