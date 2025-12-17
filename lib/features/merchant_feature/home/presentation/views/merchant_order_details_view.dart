import 'package:flutter/material.dart';

import '../widgets/order_details_widgets/order_details_app_bar.dart';

class MerchantOrderDetailsView extends StatelessWidget {
  const MerchantOrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [OrderDetailsAppBar()]),
        ),
      ),
    );
  }
}
