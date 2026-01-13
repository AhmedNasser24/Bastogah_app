import 'package:bastogah_app/core/widgets/custom_skeletonizer.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:bastogah_app/features/user_feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCartItem extends StatelessWidget {
  const ListOfCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          CustomToastification.showFailureToast(message: state.message);
        }
      },
      builder: (context, state) {
        switch (state) {
          case CartLoading():
          case CartInitial():
          case CartFailure():
            return const CustomSkeletonizer(child: CartItem());

          case CartLoaded():
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                return CartItem(cartModel: state.cart[index]);
              },
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
