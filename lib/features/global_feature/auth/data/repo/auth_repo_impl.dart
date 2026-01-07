import 'package:bastogah_app/core/enums/roles_enum.dart';
import 'package:bastogah_app/core/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/local_storage_services/shared_preference_singleton.dart';
import '../../domain/repos/auth_repo.dart';
import '../remote_data_source/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<Failure, RolesEnum>> login({
    required String username,
    required String password,
  }) async {
    try {
      var body = await authDataSource.login(
        username: username,
        password: password,
      );
      LoginModel loginModel = LoginModel.fromJson(body);
      await _saveUserDataLocally(loginModel);
      return right(loginModel.role!);
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
      loginModel.role!.title,
    );
  }
}
