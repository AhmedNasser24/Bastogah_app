import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/user_order_app_bar.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserOrdersAppBar(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: [Gap(20), Text('User Orders View')]),
          ),
        ),
      ],
    );
  }
}
