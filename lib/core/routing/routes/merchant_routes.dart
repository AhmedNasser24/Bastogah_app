import 'package:bastogah_app/features/merchant_feature/home/presentation/views/merchant_home_view.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/views/merchant_order_details_view.dart';
import 'package:bastogah_app/features/merchant_feature/products/presentation/views/merchant_products_view.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/views/Merchant_add_sub_categories_view.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/views/merchant_profile_view.dart';
import 'package:go_router/go_router.dart';
import '../../../features/merchant_feature/auth/presentation/views/merchant_forget_password.dart';
import '../../../features/merchant_feature/auth/presentation/views/merchant_login_view.dart';
import '../../../features/merchant_feature/home/data/models/order_item_model/order_item_model.dart';
import '../../../features/merchant_feature/home/presentation/views/merchant_add_new_order_view.dart';
import '../../../features/merchant_feature/merchant_layout/presentation/views/merchant_layout.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_add_or_edit_product_view.dart';
import '../../../features/merchant_feature/products/presentation/views/merchant_product_details_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_add_product_category_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_edit_profile_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_help_support_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_notification_view.dart';
import '../../../features/merchant_feature/profile/presentation/views/merchant_privacy_view.dart';
import '../../../features/merchant_feature/reports/presentation/views/merchant_report_view.dart';
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
        name: RouteName.merchantHome,
        path: RouteName.merchantHome,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantHomeView(),
        ),
      ),
      GoRoute(
        name: RouteName.merchantProducts,
        path: RouteName.merchantProducts,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantProductsView(),
        ),
      ),
      GoRoute(
        name: RouteName.merchantReports,
        path: RouteName.merchantReports,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantReportsView(),
        ),
      ),
      GoRoute(
        name: RouteName.merchantProfile,
        path: RouteName.merchantProfile,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const MerchantProfileView(),
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
