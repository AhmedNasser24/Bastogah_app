import 'package:bastogah_app/core/enums/roles_enum.dart';
import 'package:bastogah_app/features/global_feature/auth/domain/use_cases/login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failure.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  void login(String username, String password) async {
    emit(LoginLoading());

    Either<Failure, RolesEnum> result = await loginUseCase(
      username: username,
      password: password,
    );

    result.fold(
      (fail) => emit(LoginFailure(errMessage: fail.errMessage)),
      (role) => emit(LoginSuccess(role: role)),
    );
  }
}
