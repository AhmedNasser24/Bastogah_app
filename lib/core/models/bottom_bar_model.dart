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

List<BottomBarModel> userBottomBarItems = [
  BottomBarModel(
    title: 'bottom_nav_bar.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.userHome,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.my_orders'.tr(),
    inactiveIcon: AppIcons.iconsInactiveUserOrder,
    activeIcon: AppIcons.iconsActiveUserOrders,
    routeName: RouteName.userOrders,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.discounts'.tr(),
    inactiveIcon: AppIcons.iconsInactiveUserDiscount,
    activeIcon: AppIcons.iconsActiveUserDiscount,
    routeName: RouteName.userDiscounts,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.favorites'.tr(),
    inactiveIcon: AppIcons.iconsInactiveUserFavourite,
    activeIcon: AppIcons.iconsActiveUserFavourite,
    routeName: RouteName.userFavorites,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.userProfile,
  ),
];

List<BottomBarModel> driverBottomBarItems = [
  BottomBarModel(
    title: 'bottom_nav_bar.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.driverHome,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.reports'.tr(),
    inactiveIcon: AppIcons.iconsInactiveReportIcon,
    activeIcon: AppIcons.iconsActiveReportIcon,
    routeName: RouteName.driverReports,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.driverProfile,
  ),
];

List<BottomBarModel> merchantBottomBarItems = [
  BottomBarModel(
    title: 'bottom_nav_bar.home'.tr(),
    inactiveIcon: AppIcons.iconsInactiveHomeIcon,
    activeIcon: AppIcons.iconsActiveHomeIcon,
    routeName: RouteName.merchantHome,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.products'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProductIcon,
    activeIcon: AppIcons.iconsActiveProductsIcon,
    routeName: RouteName.merchantProducts,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.reports'.tr(),
    inactiveIcon: AppIcons.iconsInactiveReportIcon,
    activeIcon: AppIcons.iconsActiveReportIcon,
    routeName: RouteName.merchantReports,
  ),
  BottomBarModel(
    title: 'bottom_nav_bar.my_account'.tr(),
    inactiveIcon: AppIcons.iconsInactiveProfileIcon,
    activeIcon: AppIcons.iconsActiveProfileIcon,
    routeName: RouteName.merchantProfile,
  ),
];
