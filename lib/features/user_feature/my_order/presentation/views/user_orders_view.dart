import 'package:bastogah_app/features/user_feature/my_order/presentation/widgets/list_of_my_order_item.dart';
import 'package:flutter/material.dart';

import '../widgets/user_order_app_bar.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserOrdersAppBar(),
        Expanded(child: ListOfMyOrderItem()),
      ],
    );
  }
}
