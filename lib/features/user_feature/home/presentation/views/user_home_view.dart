// ignore_for_file: unused_import

import 'package:bastogah_app/features/user_feature/home/presentation/widgets/custom_slider.dart';
import 'package:bastogah_app/features/user_feature/user_layout/presentation/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../manager/sliders_cubit/sliders_cubit.dart';
import '../widgets/home_store_category.dart';
import '../widgets/sliver_list_of_user_product_items.dart';
import '../widgets/sliver_list_of_user_store_items.dart';
import '../widgets/user_home_filter.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  late SlidersCubit slidersCubit;
  @override
  void initState() {
    super.initState();

    slidersCubit = getIt<SlidersCubit>()..getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => slidersCubit,
      child: const Column(
        children: [
          UserAppBar(address: "بغداد,العراق"),
          CustomSearchField(),
          Gap(12),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverGap(16),
                SliverToBoxAdapter(child: HomeStoreCategory()),
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
        ],
      ),
    );
  }
}
