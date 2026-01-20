import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/manager/user_order_cubit/user_order_cubit.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/widgets/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state_enum.dart';
import '../../../../../core/widgets/custom_toast/custom_toastification.dart';

class ListOfMyOrderItem extends StatefulWidget {
  const ListOfMyOrderItem({super.key});

  @override
  State<ListOfMyOrderItem> createState() => _ListOfMyOrderItemState();
}

class _ListOfMyOrderItemState extends State<ListOfMyOrderItem> {
  ScrollController scrollController = ScrollController();
  late UserOrderCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UserOrderCubit>(context);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        cubit.loadMoreOrders();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserOrderCubit, UserOrderState>(
      listener: (context, state) {
        if (state.orderState == RequestStateEnum.failure) {
          CustomToastification.showFailureToast(message: state.errMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.orderState != current.orderState,
      listenWhen: (previous, current) =>
          previous.orderState != current.orderState,
      builder: (context, state) {
        if (state.orderState == RequestStateEnum.loading ||
            state.orderState == RequestStateEnum.failure ||
            state.orderState == RequestStateEnum.initial) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: CustomSkeletonizer(child: MyOrderItem()),
              );
            },
          );
        } else if (state.orderState == RequestStateEnum.success ||
            state.orderState == RequestStateEnum.loadingMore) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: state.orderList.length + (state.moreItem ? 1 : 0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: index < state.orderList.length
                    ? const MyOrderItem()
                    : const CustomSkeletonizer(child: MyOrderItem()),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
