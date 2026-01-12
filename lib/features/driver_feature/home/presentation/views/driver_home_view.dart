import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../merchant_feature/home/presentation/widgets/home_widgets/current_dues.dart';
import '../../../../user_feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import '../widgets/home_widgets/driver_filters_home.dart';
import '../widgets/home_widgets/driver_order_items_list.dart';

class DriverHomeView extends StatefulWidget {
  const DriverHomeView({super.key});

  @override
  State<DriverHomeView> createState() => _DriverHomeViewState();
}

class _DriverHomeViewState extends State<DriverHomeView> {
  // late MerchantGetOrdersCubit merchantGetOrdersCubit;
  ScrollController controller = ScrollController();
  late ProfileCubit profileCubit;
  @override
  void initState() {
    super.initState();
    profileCubit = getIt<ProfileCubit>()
      ..getProfile(); // to check if it is active or not and this handle in cubit
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MerchantAppBar(title: "merchant.hello".tr()),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              // merchantGetOrdersCubit.refresh();
            },
            child: CustomScrollView(
              controller: controller,
              slivers: const [
                SliverToBoxAdapter(child: CurrentDues()),
                SliverGap(12),
                SliverToBoxAdapter(child: CustomSearchField()),
                SliverGap(12),
                SliverToBoxAdapter(child: DriverFiltersHome()),
                SliverGap(12),
                DriverOrderItemsList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
