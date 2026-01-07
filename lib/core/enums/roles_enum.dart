import '../routing/route_name.dart';

enum RolesEnum {
  merchant('merchant', RouteName.login),
  client('client', RouteName.userRegister),
  driver('driver', RouteName.login);

  final String title;
  final String routeName;
  const RolesEnum(this.title, this.routeName);

  static RolesEnum fromValue(String value) {
    switch (value) {
      case 'merchant':
        return RolesEnum.merchant;
      case 'client':
        return RolesEnum.client;
      case 'driver':
        return RolesEnum.driver;
      default:
        return RolesEnum.client;
    }
  }
}
