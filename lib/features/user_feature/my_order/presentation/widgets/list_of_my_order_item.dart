import 'package:bastogah_app/features/user_feature/my_order/presentation/widgets/my_order_item.dart';
import 'package:flutter/material.dart';

class ListOfMyOrderItem extends StatelessWidget {
  const ListOfMyOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: MyOrderItem(),
        );
      },
    );
  }
}
