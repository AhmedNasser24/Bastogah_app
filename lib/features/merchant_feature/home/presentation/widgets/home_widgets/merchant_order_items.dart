import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/manager/cubit/merchant_get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/merchant_filter_enums.dart';
import 'merchant_order_items_grid_pagination.dart';

class MerchantOrderItems extends StatelessWidget {
  const MerchantOrderItems({super.key});

  final MerchantFilterEnum selectedFilter = MerchantFilterEnum.cancelled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantGetOrdersCubit, MerchantGetOrdersState>(
      builder: (context, state) {
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
          return MerchantOrderItemsGridPagination(state: state);
        } else {
          return const SliverFillRemaining(child: SizedBox.shrink());
        }
      },
    );
  }
}
