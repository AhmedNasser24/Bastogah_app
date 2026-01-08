part of 'user_products_cubit.dart';

class UserProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserProductsInitial extends UserProductsState {}

class UserProductsLoading extends UserProductsState {}

class UserProductsSuccessFull extends UserProductsState {
  final List<UserProductModel> products;
  final bool moreItem;
  UserProductsSuccessFull({required this.products, required this.moreItem});

  @override
  List<Object?> get props => [products, moreItem];
}

class UserProductsFailure extends UserProductsState {
  final String errorMessage;
  UserProductsFailure({required this.errorMessage});
}
