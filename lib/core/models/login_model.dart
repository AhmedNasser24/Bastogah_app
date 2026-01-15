import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/enums/roles_enum.dart';

class LoginModel {
  String? userId, accessToken, refreshToken;
  RoleEnum? role;
  String? username, password;
  LoginModel({
    this.userId,
    this.accessToken,
    this.refreshToken,
    this.role,
    this.username,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json[ApiKeys.userId],
      accessToken: json[ApiKeys.accessToken],
      refreshToken: json[ApiKeys.refreshToken],
      role: json[ApiKeys.roles][0] == 'merchant'
          ? RoleEnum.merchant
          : json[ApiKeys.roles][0] == "client"
          ? RoleEnum.client
          : RoleEnum.driver,
    );
  }
}
