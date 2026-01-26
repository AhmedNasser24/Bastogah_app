import 'dart:developer';

import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/routes/driver_routes.dart';
import 'package:bastogah_app/core/routing/routes/user_routes.dart';
import 'package:bastogah_app/features/global_feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/global_feature/auth/presentation/views/forget_password_view.dart';
import '../../features/global_feature/auth/presentation/views/login_view.dart';
import '../../features/global_feature/auth/presentation/views/user_register_view.dart';
import '../../features/global_feature/common/presentation/views/help_support_view.dart';
import '../../features/global_feature/common/presentation/views/notification_view.dart';
import '../../features/global_feature/common/presentation/views/privacy_view.dart';
import '../network/connection_service.dart';
import '../widgets/no_internet_view.dart';
import 'router_animation.dart';
import 'routes/merchant_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
// ignore: unused_element
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RouteName.login,
  refreshListenable: ConnectionService(),
  redirect: (context, state) {
    final bool isConnected = ConnectionService().isConnected;
    log("-------------isConnected : $isConnected ------------------");
    log(
      "-------------state.matchedLocation : ${state.matchedLocation} ------------------",
    );
    log("-------------state.fullPath : ${state.fullPath} ------------------");
    log("-------------state.uri : ${state.uri} ------------------");
    log(
      "-------------state.uri.toString() : ${state.uri.toString()} ------------------",
    );
    log("-------------state.pageKey : ${state.pageKey} ------------------");

    // final isNoInternetPage = state.matchedLocation == RouteName.noInternet;

    // if (!isConnected && !isNoInternetPage) {
    //   return RouteName.noInternet;
    // }
    final isNoInternetPage = state.matchedLocation == RouteName.noNetwork;

    if (!isConnected && !isNoInternetPage) {
      return RouteName.noNetwork;
    }
    // if (isConnected && isNoInternetPage) {
    //   final role = getRoleEnum();
    //   if (role == RoleEnum.driver) {
    //     return RouteName.driverAppLayout;
    //   } else if (role == RoleEnum.merchant) {
    //     return RouteName.merchantLayout;
    //   } else {
    //     return RouteName.customerAppLayout;
    //   }
    // }
    return null;
  },
  routes: [
    ...userRoutes,
    ...driverRoutes,
    ...merchantRoutes,
    GoRoute(
      path: RouteName.splash,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const SplashView(),
      ),
    ),

    GoRoute(
      path: RouteName.login,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: RouteName.noNetwork,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const NoInternetView(),
      ),
    ),
    GoRoute(
      path: RouteName.userRegister,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const UserRegisterView(),
      ),
    ),
    GoRoute(
      path: RouteName.forgotPassword,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const ForgetPasswordView(),
      ),
    ),
    GoRoute(
      path: RouteName.notification,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const NotificationView(),
      ),
    ),
    GoRoute(
      path: RouteName.helpSupport,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const HelpSupportView(),
      ),
    ),
    GoRoute(
      path: RouteName.privacy,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const PrivacyView(),
      ),
    ),
  ],
);
