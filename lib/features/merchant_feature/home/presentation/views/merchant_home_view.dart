import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/widgets/custom_floating_action_button.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/manager/cubit/merchant_get_orders_cubit.dart';
import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../widgets/home_widgets/current_dues.dart';
import '../widgets/home_widgets/merchant_filters_home.dart';
import '../widgets/home_widgets/merchant_order_items.dart';

class MerchantHomeView extends StatefulWidget {
  const MerchantHomeView({super.key});

  @override
  State<MerchantHomeView> createState() => _MerchantHomeViewState();
}

class _MerchantHomeViewState extends State<MerchantHomeView> {
  late MerchantGetOrdersCubit merchantGetOrdersCubit;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    merchantGetOrdersCubit = getIt.get<MerchantGetOrdersCubit>();
    merchantGetOrdersCubit.fetchOrders(status: 0);
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          merchantGetOrdersCubit.moreItem) {
        merchantGetOrdersCubit.fetchMoreOrders();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => merchantGetOrdersCubit,
      child: Scaffold(
        body: Column(
          children: [
            MerchantAppBar(title: "merchant.hello".tr()),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  merchantGetOrdersCubit.refresh();
                },
                child: CustomScrollView(
                  controller: controller,
                  slivers: const [
                    SliverToBoxAdapter(child: CurrentDues()),
                    SliverGap(12),
                    SliverToBoxAdapter(child: CustomSearchField()),
                    SliverGap(12),
                    SliverToBoxAdapter(child: MerchantFiltersHome()),
                    SliverGap(12),
                    MerchantOrderItems(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onTap: () {
            context.push(RouteName.merchantAddNewOrder);
          },
        ),
      ),
    );
  }
}
