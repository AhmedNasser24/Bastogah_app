part of 'merchant_categories_cubit.dart';

sealed class MerchantCategoriesState extends Equatable {
  const MerchantCategoriesState();

  @override
  List<Object> get props => [];
}

final class MerchantCategoriesInitial extends MerchantCategoriesState {}

final class MerchantCategoriesLoading extends MerchantCategoriesState {}

final class MerchantCategoriesSuccess extends MerchantCategoriesState {
  final List<MerchantCategoryModel> merchantCategories;
  const MerchantCategoriesSuccess({required this.merchantCategories});
}

final class MerchantCategoriesFailure extends MerchantCategoriesState {
  final String errMessage;
  const MerchantCategoriesFailure({required this.errMessage});
}
