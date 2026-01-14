import 'dart:developer';

import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/local_storage_data/local_storage_data.dart';
import '../../../../../core/routing/route_name.dart';
import '../../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
import '../../../favourites/presentation/widgets/user_merchant_item.dart';
import '../../data/model/user_merchant_model.dart';
import '../../data/params/user_merchant_param.dart';
import '../manager/user_merchants_cubit/user_merchants_cubit.dart';

class UserMerchantsList extends StatefulWidget {
  const UserMerchantsList({super.key, required this.userMerchantParam});

  final UserMerchantParam userMerchantParam;

  @override
  State<UserMerchantsList> createState() => _UserMerchantsListState();
}

class _UserMerchantsListState extends State<UserMerchantsList> {
  late UserMerchantsCubit userMerchantsCubit;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    userMerchantsCubit = getIt<UserMerchantsCubit>();
    userMerchantsCubit.fetchMerchants(
      userMerchantParam: widget.userMerchantParam,
    );
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          userMerchantsCubit.moreItem &&
          !userMerchantsCubit.isLoadingMore) {
        userMerchantsCubit.fetchMoreMerchants(
          userMerchantParam: widget.userMerchantParam,
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<UserMerchantsCubit>(
          context,
        ).refresh(userMerchantParam: widget.userMerchantParam);
      },
      child: BlocConsumer<UserMerchantsCubit, UserMerchantsState>(
        listener: (context, state) {
          if (state is UserMerchantsFailure) {
            CustomToastification.showFailureToast(message: state.errorMessage);
          }
        },
        builder: (context, state) {
          bool isFirstOperation = BlocProvider.of<UserMerchantsCubit>(
            context,
          ).isFirstOperation;
          if (state is UserMerchantsLoading ||
              state is UserMerchantsInitial ||
              (state is UserMerchantsFailure && isFirstOperation)) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                maxCrossAxisExtent: 600,
                mainAxisExtent: 300,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const CustomSkeletonizer(child: UserMerchantItem());
              },
            );
          }
          List<UserMerchantModel> merchants =
              BlocProvider.of<UserMerchantsCubit>(context).merchants;
          bool moreItem = BlocProvider.of<UserMerchantsCubit>(context).moreItem;
          return ValueListenableBuilder<List<UserMerchantModel>>(
            valueListenable: LocalStorageData.favouriteListNotifier,
            builder: (context, favourites, child) {
              return GridView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: 600,
                  mainAxisExtent: 300,
                ),
                itemCount: merchants.length + (moreItem ? 2 : 0),
                itemBuilder: (context, index) {
                  if (index < merchants.length) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          RouteName.userProducts,
                          extra: merchants[index],
                        );
                      },
                      child: UserMerchantItem(
                        merchant: merchants[index],
                        favourites: favourites,
                      ),
                    );
                  } else {
                    return const CustomSkeletonizer(child: UserMerchantItem());
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
