import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

abstract class MerchantAuthRepo {
  Future<Either<Failure, void>> login({
    required String username,
    required String password,
  });
}
