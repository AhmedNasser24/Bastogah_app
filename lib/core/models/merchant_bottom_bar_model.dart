import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';

import '../routing/route_name.dart';

class MerchantBottomBarModel {
  final String title;
  final String inactiveIcon;
  final String activeIcon;
  final String routeName;
  MerchantBottomBarModel({
    required this.title,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.routeName,
  });
}

List<MerchantBottomBarModel> merchantBottomBarItems = [
  MerchantBottomBarModel(
    title: 'merchant.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.merchantHome,
  ),
  MerchantBottomBarModel(
    title: 'merchant.products'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProductIcon,
    activeIcon: AppIcons.iconsActiveProductsIcon,
    routeName: RouteName.merchantProducts,
  ),
  MerchantBottomBarModel(
    title: 'merchant.reports'.tr(),
    inactiveIcon: AppIcons.iconsInactiveReportIcon,
    activeIcon: AppIcons.iconsActiveReportIcon,
    routeName: RouteName.merchantReports,
  ),
  MerchantBottomBarModel(
    title: 'merchant.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.merchantProfile,
  ),
];
