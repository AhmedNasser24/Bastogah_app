part of 'sliders_cubit.dart';

sealed class SlidersState extends Equatable {
  const SlidersState();

  @override
  List<Object> get props => [];
}

final class SlidersInitial extends SlidersState {}

final class SlidersLoading extends SlidersState {}

final class SlidersLoadedSuccess extends SlidersState {
  final List<SliderModel> sliders;

  const SlidersLoadedSuccess({required this.sliders});
  @override
  List<Object> get props => [sliders];
}

final class SlidersFailure extends SlidersState {}
