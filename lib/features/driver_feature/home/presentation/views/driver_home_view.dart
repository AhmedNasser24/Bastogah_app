import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../merchant_feature/home/presentation/widgets/home_widgets/current_dues.dart';
import '../widgets/home_widgets/driver_filters_home.dart';

class DriverHomeView extends StatefulWidget {
  const DriverHomeView({super.key});

  @override
  State<DriverHomeView> createState() => _DriverHomeViewState();
}

class _DriverHomeViewState extends State<DriverHomeView> {
  // late MerchantGetOrdersCubit merchantGetOrdersCubit;
  ScrollController controller = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   merchantGetOrdersCubit = getIt.get<MerchantGetOrdersCubit>();
  //   merchantGetOrdersCubit.fetchOrders(status: 0);
  //   controller.addListener(() {
  //     if (controller.position.pixels >=
  //             controller.position.maxScrollExtent - 200 &&
  //         merchantGetOrdersCubit.moreItem) {
  //       merchantGetOrdersCubit.fetchMoreOrders();
  //     }
  //   });
  // }

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
                // SliverGap(12),
                // MerchantOrderItems(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
