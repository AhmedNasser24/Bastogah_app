import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/routes/driver_routes.dart';
import 'package:bastogah_app/core/routing/routes/user_routes.dart';
import 'package:bastogah_app/features/global_feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/global_feature/auth/presentation/views/forget_password.dart';
import '../../features/global_feature/auth/presentation/views/merchant_and_driver_login_view.dart';
import '../../features/global_feature/auth/presentation/views/user_login_view.dart';
import '../../features/global_feature/auth/presentation/views/user_register_view.dart';
import '../../features/global_feature/common/presentation/views/help_support_view.dart';
import '../../features/global_feature/common/presentation/views/notification_view.dart';
import '../../features/global_feature/common/presentation/views/privacy_view.dart';
import '../../features/global_feature/common/presentation/views/role_view.dart';
import 'router_animation.dart';
import 'routes/merchant_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
// ignore: unused_element
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.writeYourReview,
  routes: [
    GoRoute(
      path: RouteName.splash,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: RouteName.role,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const RoleView(),
      ),
    ),
    GoRoute(
      path: RouteName.merchantAndDriverLogin,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const MerchantAndDriverLoginView(),
      ),
    ),
    GoRoute(
      path: RouteName.userLogin,
      pageBuilder: (context, state) => buildPageWithSlideTransition(
        context: context,
        state: state,
        child: const UserLoginView(),
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
    ...driverRoutes,
    ...merchantRoutes,
    ...userRoutes,
  ],
);
