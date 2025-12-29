import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/router_animation.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/views/user_orders_view.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/user_feature/profile/presentation/views/user_edit_profile_view.dart';
import '../../../features/user_feature/user_layout/presentation/views/user_layout.dart';

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
          child: const UserOrdersView(),
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
          child: const UserProfileView(),
        ),
      ),
    ],
  ),
  GoRoute(
    path: RouteName.userEditProfile,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserEditProfileView(),
    ),
  ),
];
