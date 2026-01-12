import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/user_products_cubit/user_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../../data/model/user_product_model.dart';
import 'user_products_item.dart';

class UserProductsList extends StatelessWidget {
  const UserProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProductsCubit, UserProductsState>(
      listener: (context, state) {
        if (state is UserProductsFailure) {
          CustomToastification.showFailureToast(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        bool isFirstOperation = BlocProvider.of<UserProductsCubit>(
          context,
        ).isFirstOperation;
        if (state is UserProductsLoading ||
            state is UserProductsInitial ||
            (state is UserProductsFailure && isFirstOperation)) {
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
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 700,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 90,
          ),
          itemCount: products.length + (moreItem ? 2 : 0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: index < products.length
                  ? UserProductItem(product: products[index])
                  : const CustomSkeletonizer(child: UserProductItem()),
            );
          },
        );
      },
    );
  }
}
