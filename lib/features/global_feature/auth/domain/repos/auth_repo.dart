import 'package:bastogah_app/core/enums/roles_enum.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, RoleEnum>> login({
    required String username,
    required String password,
  });
}
