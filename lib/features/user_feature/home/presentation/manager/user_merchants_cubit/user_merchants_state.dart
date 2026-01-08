part of 'user_merchants_cubit.dart';

class UserMerchantsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserMerchantsInitial extends UserMerchantsState {}

class UserMerchantsLoading extends UserMerchantsState {}

class UserMerchantsSuccessFull extends UserMerchantsState {
  final List<UserMerchantModel> merchants;
  final bool moreItem;
  UserMerchantsSuccessFull({required this.merchants, required this.moreItem});

  @override
  List<Object?> get props => [merchants, moreItem];
}

class UserMerchantsFailure extends UserMerchantsState {
  final String errorMessage;
  UserMerchantsFailure({required this.errorMessage});
}
