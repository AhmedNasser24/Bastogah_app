import '../routing/route_name.dart';

enum RoleEnum {
  merchant('merchant', RouteName.login),
  client('client', RouteName.userRegister),
  driver('driver', RouteName.login);

  final String title;
  final String routeName;
  const RoleEnum(this.title, this.routeName);

  static RoleEnum fromValue(String value) {
    switch (value) {
      case 'merchant':
        return RoleEnum.merchant;
      case 'client':
        return RoleEnum.client;
      case 'driver':
        return RoleEnum.driver;
      default:
        return RoleEnum.client;
    }
  }
}
