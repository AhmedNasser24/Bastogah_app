part of 'user_home_cubit.dart';

class UserHomeState extends Equatable {
  final RequestStateEnum sliderRequestState;
  final RequestStateEnum merchantCategoriesRequestState;
  final List<SliderModel> sliderList;
  final List<MerchantCategoryModel> merchantCategoryList;
  final String errMessage;

  const UserHomeState({
    this.sliderRequestState = RequestStateEnum.initial,
    this.merchantCategoriesRequestState = RequestStateEnum.initial,
    this.sliderList = const [],
    this.merchantCategoryList = const [],
    this.errMessage = '',
  });

  @override
  List<Object> get props => [
    sliderRequestState,
    merchantCategoriesRequestState,
    sliderList,
    merchantCategoryList,
    errMessage,
  ];

  UserHomeState copyWith({
    RequestStateEnum? sliderRequestState,
    RequestStateEnum? merchantCategoriesRequestState,
    List<SliderModel>? sliderList,
    List<MerchantCategoryModel>? merchantCategoryList,
    String? errMessage,
  }) {
    return UserHomeState(
      sliderRequestState: sliderRequestState ?? this.sliderRequestState,
      merchantCategoriesRequestState:
          merchantCategoriesRequestState ?? this.merchantCategoriesRequestState,
      sliderList: sliderList ?? this.sliderList,
      merchantCategoryList: merchantCategoryList ?? this.merchantCategoryList,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

// final class SlidersInitial extends HomeState {}

// final class SlidersLoading extends HomeState {}

// final class SlidersLoadedSuccess extends HomeState {
//   final List<SliderModel> sliders;

//   const SlidersLoadedSuccess({required this.sliders});
//   @override
//   List<Object> get props => [sliders];
// }

// final class SlidersFailure extends HomeState {
//   final String errMessage;

//   const SlidersFailure({required this.errMessage});
// }
