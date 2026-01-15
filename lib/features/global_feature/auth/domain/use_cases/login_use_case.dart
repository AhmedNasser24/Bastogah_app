import 'package:bastogah_app/features/global_feature/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/enums/roles_enum.dart';
import '../../../../../core/errors/failure.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase({required this.authRepo});
  Future<Either<Failure, RoleEnum>> call({
    required String username,
    required String password,
  }) async {
    return await authRepo.login(username: username, password: password);
  }
}
