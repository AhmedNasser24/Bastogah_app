import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/features/global_feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router_animation.dart';
import 'routes/merchant_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
// ignore: unused_element
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

class AppRoute {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteName.merchantOrderDetails,
    routes: [
      GoRoute(
        path: RouteName.splash,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      ...merchantRoutes,
    ],
  );
}
