import 'package:bastogah_app/features/merchant_feature/auth/domain/use_cases/merchant_login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failure.dart';

part 'merchant_login_state.dart';

class MerchantLoginCubit extends Cubit<MerchantLoginState> {
  MerchantLoginCubit({required this.loginUseCase})
    : super(MerchantLoginInitial());
  final MerchantLoginUseCase loginUseCase;
  void login(String username, String password) async {
    emit(MerchantLoginLoading());

    Either<Failure, void> result = await loginUseCase(
      username: username,
      password: password,
    );

    result.fold(
      (fail) => emit(MerchantLoginFailure(error: fail.toString())),
      (ok) => emit(MerchantLoginSuccess()),
    );
  }
}
