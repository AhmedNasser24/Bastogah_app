import 'package:bastogah_app/core/api/api_keys.dart';
import 'package:bastogah_app/core/enums/roles_enum.dart';

class LoginModel {
  final String userId, accessToken, refreshToken;
  final RolesEnum role;
  const LoginModel({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json[ApiKeys.userId],
      accessToken: json[ApiKeys.accessToken],
      refreshToken: json[ApiKeys.refreshToken],
      role: json[ApiKeys.roles][0] == 'merchant'
          ? RolesEnum.merchant
          : RolesEnum.customer,
    );
  }
}
