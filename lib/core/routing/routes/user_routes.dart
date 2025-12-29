import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/router_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/user_feature/merchant_layout/presentation/views/user_layout.dart';

List<RouteBase> userRoutes = [
  ShellRoute(
    pageBuilder: (context, state, child) {
      return buildPageWithSlideTransition(
        context: context,
        state: state,
        child: UserLayout(child: child),
      );
    },
    routes: [
      GoRoute(
        path: RouteName.userHome,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text("User Home View")),
        ),
      ),
      GoRoute(
        path: RouteName.userOrders,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text("User my orders View")),
        ),
      ),
      GoRoute(
        path: RouteName.userDiscounts,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text("User discounts View")),
        ),
      ),
      GoRoute(
        path: RouteName.userFavorites,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text("User favorites View")),
        ),
      ),
      GoRoute(
        path: RouteName.userProfile,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const Center(child: Text("User Profile View")),
        ),
      ),
    ],
  ),
];
