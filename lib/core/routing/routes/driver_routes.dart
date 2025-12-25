import 'package:bastogah_app/features/merchant_feature/home/presentation/views/merchant_order_details_view.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/views/Merchant_add_sub_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/driver_feature/driver_layout/presentation/views/driver_layout.dart';
import '../../../features/driver_feature/reports/presentation/views/driver_report_view.dart';
import '../../../features/merchant_feature/home/data/models/order_item_model/order_item_model.dart';
import '../../../features/merchant_feature/home/presentation/views/merchant_add_new_order_view.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_add_or_edit_product_view.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_product_details_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_add_product_category_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_edit_profile_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_help_support_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_notification_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_privacy_view.dart';
import '../route_name.dart';
import '../router_animation.dart';

List<RouteBase> driverRoutes = [
  ShellRoute(
    pageBuilder: (context, state, child) {
      return buildPageWithSlideTransition(
        context: context,
        state: state,
        child: DriverLayout(child: child),
      );
    },
    routes: [
      GoRoute(
        name: RouteName.driverHome,
        path: RouteName.driverHome,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text('Driver Profile View')),
        ),
      ),

      GoRoute(
        name: RouteName.driverReports,
        path: RouteName.driverReports,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const DriverReportsView(),
        ),
      ),
      GoRoute(
        name: RouteName.driverProfile,
        path: RouteName.driverProfile,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text('Driver Profile View')),
        ),
      ),
    ],
  ),
  GoRoute(
    path: RouteName.merchantOrderDetails,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: MerchantOrderDetailsView(
        order: state.extra as MerchantOrderItemModel,
      ),
    ),
  ),
  GoRoute(
    path: RouteName.merchantAddNewOrder,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantAddNewOrderView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantProductDetails,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantProductDetailsView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantAddOrEditProduct,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: MerchantAddOrEditProductView(isEdit: state.extra as bool),
    ),
  ),
  GoRoute(
    path: RouteName.merchantAddSubCategories,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantAddSubCategoriesView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantAddProductCategory,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantAddProductCategoryView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantPrivacy,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantPrivacyView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantEditProfile,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantEditProfileView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantNotification,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantNotificationView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantHelpSupport,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantHelpSupportView(),
    ),
  ),
];
