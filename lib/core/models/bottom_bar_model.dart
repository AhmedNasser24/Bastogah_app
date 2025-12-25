import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';

import '../routing/route_name.dart';

class BottomBarModel {
  final String title;
  final String inactiveIcon;
  final String activeIcon;
  final String routeName;
  BottomBarModel({
    required this.title,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.routeName,
  });
}

List<BottomBarModel> driverBottomBarItems = [
  BottomBarModel(
    title: 'merchant.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.driverHome,
  ),
  BottomBarModel(
    title: 'merchant.reports'.tr(),
    inactiveIcon: AppIcons.iconsInactiveReportIcon,
    activeIcon: AppIcons.iconsActiveReportIcon,
    routeName: RouteName.driverReports,
  ),
  BottomBarModel(
    title: 'merchant.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.driverProfile,
  ),
];

List<BottomBarModel> merchantBottomBarItems = [
  BottomBarModel(
    title: 'merchant.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.merchantHome,
  ),
  BottomBarModel(
    title: 'merchant.products'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProductIcon,
    activeIcon: AppIcons.iconsActiveProductsIcon,
    routeName: RouteName.merchantProducts,
  ),
  BottomBarModel(
    title: 'merchant.reports'.tr(),
    inactiveIcon: AppIcons.iconsInactiveReportIcon,
    activeIcon: AppIcons.iconsActiveReportIcon,
    routeName: RouteName.merchantReports,
  ),
  BottomBarModel(
    title: 'merchant.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.merchantProfile,
  ),
];
