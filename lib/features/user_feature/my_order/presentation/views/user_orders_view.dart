import 'package:bastogah_app/features/user_feature/my_order/presentation/widgets/list_of_my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/get_it_setup.dart';
import '../manager/user_order_cubit/user_order_cubit.dart';
import '../widgets/user_order_app_bar.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserOrderCubit>()..init(),
      child: const Column(
        children: [
          UserOrdersAppBar(),
          Expanded(child: ListOfMyOrderItem()),
        ],
      ),
    );
  }
}
