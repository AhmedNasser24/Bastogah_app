import 'package:bastogah_app/features/driver_feature/home/presentation/views/driver_home_view.dart';
import 'package:bastogah_app/features/driver_feature/profile/presentation/views/driver_profile_view.dart';
import 'package:go_router/go_router.dart';
import '../../../features/driver_feature/driver_layout/presentation/views/driver_layout.dart';
import '../../../features/driver_feature/home/presentation/views/driver_order_details_view.dart';
import '../../../features/driver_feature/profile/presentation/views/driver_notification_view.dart';
import '../../../features/driver_feature/profile/presentation/views/driver_edit_profile_view.dart';
import '../../../features/driver_feature/profile/presentation/views/driver_wallet_and_earnings_view.dart';
import '../../../features/driver_feature/reports/presentation/views/driver_report_view.dart';
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
          child: const DriverHomeView(),
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
          child: const DriverProfileView(),
        ),
      ),
    ],
  ),
  GoRoute(
    path: RouteName.driverOrderDetails,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const DriverOrderDetailsView(),
    ),
  ),

  GoRoute(
    path: RouteName.driverEditProfile,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const DriverEditProfileView(),
    ),
  ),
  GoRoute(
    path: RouteName.driverNotification,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const DriverNotificationView(),
    ),
  ),
  GoRoute(
    path: RouteName.driverWalletAndEarnings,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const DriverWalletAndEarningsView(),
    ),
  ),
];
