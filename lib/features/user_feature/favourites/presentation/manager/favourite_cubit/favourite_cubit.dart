import 'package:bastogah_app/features/user_feature/home/data/model/user_merchant_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/local_storage_data/local_storage_data.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  List<UserMerchantModel> getFavourites() {
    emit(FavouriteLoading());
    try {
      final favourites = LocalStorageData.getFavourites();
      emit(FavouriteLoaded(favourites: favourites));
      return favourites;
    } catch (e) {
      emit(FavouriteFailure(message: e.toString()));
      return [];
    }
  }

  void removeFavourite(UserMerchantModel merchant) async {
    emit(FavouriteLoading());
    try {
      await LocalStorageData.removeFavouriteItem(merchant.id!);
      emit(FavouriteLoaded(favourites: LocalStorageData.getFavourites()));
    } catch (e) {
      emit(FavouriteFailure(message: e.toString()));
    }
  }

  // void addFavourite(UserMerchantModel merchant) async {
  //   emit(FavouriteLoading());
  //   try {
  //     await LocalStorageData.addFavourite(merchant);
  //     emit(FavouriteLoaded(favourites: LocalStorageData.getFavourites()));
  //   } catch (e) {
  //     emit(FavouriteFailure(message: e.toString()));
  //   }
  // }
}
