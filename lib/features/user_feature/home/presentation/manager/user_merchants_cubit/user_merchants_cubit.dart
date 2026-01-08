import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_merchant_model.dart';
import '../../../data/params/user_merchant_param.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'user_merchants_state.dart';

class UserMerchantsCubit extends Cubit<UserMerchantsState> {
  UserMerchantsCubit({required this.userHomeRepo})
    : super(UserMerchantsInitial());
  final UserHomeRepo userHomeRepo;

  final int _skip = 0;
  bool moreItem = true;
  final int maxItem = 20;
  final List<UserMerchantModel> _merchants = [];

  // void fetchMerchants({
  //   required UserMerchantParam userMerchantParam,
  // }) async {
  //   _skip = 0;
  //   moreItem = true;
  //   _merchants.clear();

  //   emit(UserMerchantsLoading());
  //   log("loading");
  //   var result = await userHomeRepo.getMerchants(
  //     userMerchantParam: userMerchantParam,
  //   );
  //   result.fold(
  //     (failure) => emit(UserMerchantsFailure(errorMessage: failure.errMessage)),
  //     (merchants) {
  //       moreItem = merchants.length == maxItem;
  //       _merchants = merchants;
  //       if (moreItem) {
  //         _skip += 20;
  //       }
  //       log(merchants.toString());
  //       emit(
  //         UserMerchantsSuccessFull(
  //           merchants: _merchants,
  //           moreItem: moreItem,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void fetchMoreMerchants() async {
  //   log("moreItems : $moreItem");
  //   if (!moreItem) return;
  //   log("fetching more merchants");
  //   var result = await userHomeRepo.getMerchants(
  //     userMerchantParam: UserMerchantParam(skip: _skip),
  //   );
  //   result.fold(
  //     (failure) => emit(UserMerchantsFailure(errorMessage: failure.errMessage)),
  //     (merchants) {
  //       moreItem = merchants.length == maxItem;
  //       _merchants.addAll(merchants);
  //       if (moreItem) {
  //         _skip += 20;
  //       }
  //       emit(
  //         UserMerchantsSuccessFull(
  //           merchants: _merchants,
  //           moreItem: moreItem,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void refresh() {
  //   fetchMerchants();
  // }
}
