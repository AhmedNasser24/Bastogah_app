import 'dart:async';

import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/core/network/check_network_connection.dart';
import 'package:bastogah_app/core/routing/app_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/routing/route_name.dart';
import '../../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../../data/model/profile_model.dart';
import '../../../domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Future<void> getProfile() async {
    if (!await isThereNetworkConnection()) {
      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet)) {
          CustomToastification.showSuccessToast(
            message: "internet_connection_restored".tr(),
          );
          _subscription?.cancel();
          getProfile();
        }
      });
      CustomToastification.showFailureToast(
        message: "check_your_internet_connection_and_try_again".tr(),
      );
      return;
    }
    emit(ProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold((failure) => emit(ProfileFailure(failure.errMessage)), (
      profile,
    ) {
      if (!profile.active) {
        CustomToastification.showNotificationToast(
          message: "your_account_is_not_active_please_contact_admin".tr(),
        );
        appRouter.go(RouteName.login);
        SharedPreferenceSingleton.clear();
      }

      emit(ProfileSuccess(profile));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
