import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/router_animation.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/views/user_orders_view.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/views/user_profile_view.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/views/user_my_rating_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/user_feature/favourites/presentation/views/user_favourite_view.dart';
import '../../../features/user_feature/profile/presentation/views/user_add_new_address_view.dart';
import '../../../features/user_feature/profile/presentation/views/user_coupons_view.dart';
import '../../../features/user_feature/profile/presentation/views/user_edit_profile_view.dart';
import '../../../features/user_feature/profile/presentation/views/user_saved_address_view.dart';
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
          child: const UserFavouriteView(),
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
  GoRoute(
    path: RouteName.userMyRating,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserMyRatingView(),
    ),
  ),
  GoRoute(
    path: RouteName.userCoupons,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserCouponsView(),
    ),
  ),
  GoRoute(
    path: RouteName.userSavedAddresses,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserSavedAddressView(),
    ),
  ),
  GoRoute(
    path: RouteName.userAddNewAddress,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserAddNewAddressView(),
    ),
  ),
];
