// ignore_for_file: unused_import

import 'package:bastogah_app/core/widgets/custom_refresh_indicator.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/widgets/custom_slider.dart';
import 'package:bastogah_app/features/user_feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:bastogah_app/features/user_feature/user_layout/presentation/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/global/global_index.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../manager/home_cubit/user_home_cubit.dart';
import '../widgets/user_merchant_categories.dart';
import '../widgets/sliver_list_of_user_product_items.dart';
import '../widgets/sliver_list_of_user_store_items.dart';
import '../widgets/user_home_filter.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  late UserHomeCubit userHomeCubit;
  late ProfileCubit profileCubit;
  @override
  void initState() {
    super.initState();
    userHomeCubit = getIt<UserHomeCubit>()..init();
    isViewVisited[0] = true;

    // profileCubit = getIt<ProfileCubit>()
    //   ..getProfile(); // to check if it is active or not and this handle in cubit
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userHomeCubit,
      child: Column(
        children: [
          const UserAppBar(address: "بغداد,العراق"),
          const CustomSearchField(),
          const Gap(12),
          Expanded(
            child: CustomRefreshIndicator(
              onRefresh: () async {
                userHomeCubit.refresh();
              },
              child: const CustomScrollView(
                slivers: [
                  SliverGap(16),
                  SliverToBoxAdapter(child: UserMerchantCategories()),
                  SliverGap(16),
                  SliverToBoxAdapter(child: CustomSlider()),
                  SliverGap(16),
                  SliverToBoxAdapter(child: UserHomeFilter()),
                  SliverGap(16),
                  SliverListOfUserStoreItems(),
                  // SliverListOfUserProductItems(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
