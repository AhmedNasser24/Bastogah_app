import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/routing/router_animation.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/merchant_category_model.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/views/user_home_view.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/views/user_product_details_view.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/views/user_merchants_view.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/views/write_your_review_view.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/views/user_orders_view.dart';
import 'package:bastogah_app/features/user_feature/offers/presentation/views/user_offer_view.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/views/user_profile_view.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/views/user_my_rating_view.dart';
import 'package:go_router/go_router.dart';

import '../../../features/user_feature/cart/presentation/views/cart_view.dart';
import '../../../features/user_feature/favourites/presentation/views/user_favourite_view.dart';
import '../../../features/user_feature/home/data/model/user_merchant_model.dart';
import '../../../features/user_feature/home/presentation/views/user_products_view.dart';
import '../../../features/user_feature/home/presentation/views/user_store_rating_view.dart';
import '../../../features/user_feature/offers/presentation/views/user_offers_details_view.dart';
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
          child: const UserHomeView(),
        ),
      ),
      GoRoute(
        path: RouteName.userMerchants,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: UserMerchantsView(
            merchantCategoryModel: state.extra as MerchantCategoryModel,
          ),
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
        path: RouteName.userOffers,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const UserOffersView(),
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
    path: RouteName.cart,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const CartView(),
    ),
  ),
  GoRoute(
    path: RouteName.userProductDetails,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserProductDetailsView(),
    ),
  ),
  GoRoute(
    path: RouteName.userProducts,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: UserProductsView(
        userMerchantModel: state.extra as UserMerchantModel,
      ),
    ),
  ),
  GoRoute(
    path: RouteName.writeYourReview,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const WriteYourReviewView(),
    ),
  ),
  GoRoute(
    path: RouteName.userStoreRating,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserStoreRatingView(),
    ),
  ),
  GoRoute(
    path: RouteName.userOffersDetails,
    pageBuilder: (context, state) => buildPageWithSlideTransition(
      context: context,
      state: state,
      child: const UserOffersDetailsView(),
    ),
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
