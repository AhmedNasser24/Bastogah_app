import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/merchant_feature/auth/presentation/views/merchant_login_view.dart';
import '../../../features/merchant_feature/merchant_layout/presentation/views/merchant_layout.dart';
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
        path: RouteName.merchantLayout,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const SizedBox(),
        ),
      ),
    ],
  ),
];
