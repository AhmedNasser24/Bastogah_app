import 'package:bastogah_app/core/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/local_storage_services/shared_preference_singleton.dart';
import '../../domain/repos/merchant_auth_repo.dart';
import '../remote_data_source/merchant_auth.dart';

class MerchantAuthRepoImpl extends MerchantAuthRepo {
  final MerchantAuthDataSource merchantAuth;
  MerchantAuthRepoImpl({required this.merchantAuth});
  @override
  Future<Either<Failure, void>> login({
    required String username,
    required String password,
  }) async {
    try {
      var body = await merchantAuth.login(
        username: username,
        password: password,
      );
      LoginModel loginModel = LoginModel.fromJson(body);
      await _saveUserDataLocally(loginModel);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure.defaultFailure(e.toString()));
    }
  }

  Future<void> _saveUserDataLocally(LoginModel loginModel) async {
    await SharedPreferenceSingleton.setString(
      ApiKeys.accessToken,
      loginModel.accessToken!,
    );
    await SharedPreferenceSingleton.setString(
      ApiKeys.refreshToken,
      loginModel.refreshToken!,
    );
    await SharedPreferenceSingleton.setString(
      ApiKeys.userId,
      loginModel.userId!,
    );
    await SharedPreferenceSingleton.setString(
      ApiKeys.roles,
      loginModel.role!.value,
    );
  }
}
