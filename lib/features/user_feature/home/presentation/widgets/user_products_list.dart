import 'package:bastogah_app/core/enums/request_state_enum.dart';
import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/user_products_cubit/user_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../data/model/user_product_model.dart';
import 'user_product_item.dart';

class UserProductsList extends StatelessWidget {
  const UserProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProductsCubit, UserProductsState>(
      listener: (context, state) {
        if (state.userProductsRequestState == RequestStateEnum.failure) {
          CustomToastification.showFailureToast(message: state.errMessage);
        }
      },
      buildWhen: (previous, current) {
        return previous.userProductsRequestState !=
            current.userProductsRequestState;
      },
      builder: (context, state) {
        bool isFirstOperation = BlocProvider.of<UserProductsCubit>(
          context,
        ).isFirstOperation;
        if (state.userProductsRequestState == RequestStateEnum.loading ||
            state.userProductsRequestState == RequestStateEnum.initial ||
            (state.userProductsRequestState == RequestStateEnum.failure &&
                isFirstOperation)) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 700,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 90,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomSkeletonizer(child: UserProductItem()),
              );
            },
          );
        }
        List<UserProductModel> products = BlocProvider.of<UserProductsCubit>(
          context,
        ).products;
        bool moreItem = BlocProvider.of<UserProductsCubit>(context).moreItem;
        return ValueListenableBuilder(
          valueListenable: LocalStorageData.cartsNotifier,
          builder: (context, carts, child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 700,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 92,
              ),
              itemCount: products.length + (moreItem ? 2 : 0),
              itemBuilder: (context, index) {
                int indexOfProductInCart = LocalStorageData.findItemInCard(
                  carts,
                  products[index].id!,
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: index < products.length
                      ? GestureDetector(
                          onTap: () {
                            context.goNamed(
                              RouteName.userProductDetails,
                              extra: [
                                products[index],
                                indexOfProductInCart == -1
                                    ? null
                                    : carts[indexOfProductInCart],
                              ],
                            );
                          },
                          child: UserProductItem(
                            product: products[index],
                            carts: carts,
                          ),
                        )
                      : const CustomSkeletonizer(child: UserProductItem()),
                );
              },
            );
          },
        );
      },
    );
  }
}
