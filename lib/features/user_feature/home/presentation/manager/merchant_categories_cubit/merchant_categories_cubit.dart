import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/merchant_category_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'merchant_categories_state.dart';

class MerchantCategoriesCubit extends Cubit<MerchantCategoriesState> {
  MerchantCategoriesCubit({required this.userHomeRepo})
    : super(MerchantCategoriesInitial());

  final UserHomeRepo userHomeRepo;

  Future<void> getMerchantCategories() async {
    emit(MerchantCategoriesLoading());
    final result = await userHomeRepo.getMerchantCategories();
    result.fold(
      (failure) {
        emit(MerchantCategoriesFailure(errMessage: failure.errMessage));
      },
      (merchantCategories) {
        emit(MerchantCategoriesSuccess(merchantCategories: merchantCategories));
      },
    );
  }
}
