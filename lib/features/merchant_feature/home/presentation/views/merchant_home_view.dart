import 'package:flutter/material.dart';

import '../widgets/merchant_order_item.dart';

class MerchantHomeView extends StatelessWidget {
  const MerchantHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [SliverToBoxAdapter(child: MerchantOrderItem())],
    );
  }
}
