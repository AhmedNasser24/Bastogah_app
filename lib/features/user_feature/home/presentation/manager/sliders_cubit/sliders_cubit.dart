import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/slider_model.dart';
import '../../../domain/repo/user_home_repo.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit({required this.userHomeRepo}) : super(SlidersInitial());
  final UserHomeRepo userHomeRepo;

  Future<void> getSliders() async {
    emit(SlidersLoading());
    final result = await userHomeRepo.getSliders();
    result.fold(
      (failure) {
        emit(SlidersFailure());
      },
      (sliders) {
        emit(SlidersLoadedSuccess(sliders: sliders));
      },
    );
  }
}
