import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/features/user_feature/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';

class ListOfCartItem extends StatelessWidget {
  const ListOfCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalStorageData.cartsNotifier,
      builder: (context, carts, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(
                  RouteName.userProductDetails,
                  extra: [carts[index].userProduct, carts[index]],
                );
              },
              child: CartItem(cartModel: carts[index]),
            );
          },
        );
      },
    );
  }
}
