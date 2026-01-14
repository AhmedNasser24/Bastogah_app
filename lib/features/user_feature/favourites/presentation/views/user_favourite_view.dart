import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../home/data/model/user_merchant_model.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';
import '../widgets/user_favourite_app_bar.dart';
import '../widgets/user_merchant_item.dart';

class UserFavouriteView extends StatefulWidget {
  const UserFavouriteView({super.key});

  @override
  State<UserFavouriteView> createState() => _UserFavouriteViewState();
}

class _UserFavouriteViewState extends State<UserFavouriteView> {
  late List<UserMerchantModel> favourites;
  late FavouriteCubit favouriteCubit;
  @override
  void initState() {
    super.initState();
    favouriteCubit = getIt<FavouriteCubit>();
    favourites = favouriteCubit.getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favouriteCubit,
      child: Column(
        children: [
          const UserFavouriteAppBar(),
          Expanded(
            child: BlocConsumer<FavouriteCubit, FavouriteState>(
              listener: (context, state) {
                if (state is FavouriteLoaded) {
                  favourites = state.favourites;
                } else if (state is FavouriteFailure) {
                  CustomToastification.showFailureToast(message: state.message);
                }
              },

              builder: (context, state) {
                switch (state) {
                  case FavouriteInitial():
                  case FavouriteFailure():
                  case FavouriteLoading():
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            maxCrossAxisExtent: 600,
                            mainAxisExtent: 300,
                          ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const CustomSkeletonizer(
                          child: UserMerchantItem(),
                        );
                      },
                    );
                  case FavouriteLoaded():
                    return ValueListenableBuilder<List<UserMerchantModel>>(
                      valueListenable: LocalStorageData.favouriteListNotifier,
                      builder: (context, favourites, child) {
                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                maxCrossAxisExtent: 600,
                                mainAxisExtent: 300,
                              ),
                          itemCount: favourites.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  RouteName.userProducts,
                                  extra: favourites[index],
                                );
                              },
                              child: UserMerchantItem(
                                merchant: favourites[index],
                              ),
                            );
                          },
                        );
                      },
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
