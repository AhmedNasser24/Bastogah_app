import 'package:bastogah_app/features/merchant_feature/auth/domain/repos/merchant_auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

class MerchantLoginUseCase {
  final MerchantAuthRepo repo;
  MerchantLoginUseCase({required this.repo});
  Future<Either<Failure, void>> call({
    required String username,
    required String password,
  }) async {
    return await repo.login(username: username, password: password);
  }
}
