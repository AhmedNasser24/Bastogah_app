import 'package:easy_localization/easy_localization.dart';

import '../routing/route_name.dart';

enum RolesEnum {
  merchant('role.merchant', RouteName.merchantAndDriverLogin),
  customer('role.customer', RouteName.userRegister),
  driver('role.driver', RouteName.merchantAndDriverLogin);

  final String key;
  final String routeName;
  const RolesEnum(this.key, this.routeName);

  String get title => key.tr();

  static RolesEnum fromValue(String value) {
    switch (value) {
      case 'merchant':
        return RolesEnum.merchant;
      case 'customer':
        return RolesEnum.customer;
      case 'driver':
        return RolesEnum.driver;
      default:
        return RolesEnum.customer;
    }
  }
}
