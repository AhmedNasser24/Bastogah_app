import 'package:bastogah_app/features/merchant_feature/home/presentation/views/merchant_home_view.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/views/merchant_order_details_view.dart';
import 'package:bastogah_app/features/merchant_feature/products/presentation/views/merchant_products_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/merchant_feature/auth/presentation/views/merchant_forget_password.dart';
import '../../../features/merchant_feature/auth/presentation/views/merchant_login_view.dart';
import '../../../features/merchant_feature/home/data/models/order_item_model/order_item_model.dart';
import '../../../features/merchant_feature/home/presentation/views/merchant_add_new_order_view.dart';
import '../../../features/merchant_feature/merchant_layout/presentation/views/merchant_layout.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_add_or_edit_product_view.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_product_details_view.dart';
import '../route_name.dart';
import '../router_animation.dart';

List<RouteBase> merchantRoutes = [
  GoRoute(
    path: RouteName.merchantLogin,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantLoginView(),
    ),
  ),
  GoRoute(
    path: RouteName.merchantForgotPassword,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const MerchantForgetPassword(),
    ),
  ),
  ShellRoute(
    pageBuilder: (context, state, child) {
      return buildPageWithSlideTransition(
        context: context,
        state: state,
        child: MerchantLayout(child: child),
      );
    },
    routes: [
      GoRoute(
        path: RouteName.merchantHome,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantHomeView(),
        ),
      ),
      GoRoute(
        path: RouteName.merchantProducts,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantProductsView(),
        ),
      ),
      GoRoute(
        path: RouteName.merchantReports,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text('reports')),
        ),
      ),
      GoRoute(
        path: RouteName.merchantProfile,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text('profile')),
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
      child: const MerchantAddOrEditProductView(),
    ),
  ),
];
