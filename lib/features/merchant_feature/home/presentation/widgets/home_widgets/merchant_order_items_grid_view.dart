import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/manager/cubit/merchant_get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/merchant_filter_enums.dart';
import 'merchant_order_item.dart';

class MerchantOrderItemsGridView extends StatelessWidget {
  const MerchantOrderItemsGridView({super.key});

  final MerchantFilterEnum selectedFilter = MerchantFilterEnum.cancelled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantGetOrdersCubit, MerchantGetOrdersState>(
      builder: (context, state) {
        int currentStatus = BlocProvider.of<MerchantGetOrdersCubit>(
          context,
        ).currentStatus;
        if (state is GetOrdersLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetOrdersFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                state.errorMessage,
                style: AppFontStyle.regular12red(context),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state is GetOrdersSuccessFull) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 800,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              mainAxisExtent:
                  currentStatus == MerchantFilterEnum.cancelled.status
                  ? 310
                  : 235,
            ),
            itemCount: state.orders.length,
            itemBuilder: (context, index) => MerchantOrderItem(
              currentStatus: currentStatus,
              order: state.orders[index],
            ),
          );
        } else {
          return const SliverFillRemaining(child: SizedBox.shrink());
        }
      },
    );
  }
}
