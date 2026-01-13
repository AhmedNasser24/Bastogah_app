part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<UserMerchantModel> favourites;
  const FavouriteLoaded({required this.favourites});
}

class FavouriteFailure extends FavouriteState {
  final String message;
  const FavouriteFailure({required this.message});
}
