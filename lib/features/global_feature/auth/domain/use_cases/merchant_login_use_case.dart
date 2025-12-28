import 'package:bastogah_app/features/global_feature/auth/domain/repos/merchant_auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

class MerchantLoginUseCase {
  final MerchantAuthRepo merchantAuthRepo;
  MerchantLoginUseCase({required this.merchantAuthRepo});
  Future<Either<Failure, void>> call({
    required String username,
    required String password,
  }) async {
    return await merchantAuthRepo.login(username: username, password: password);
  }
}
