import 'package:bastogah_app/features/merchant_feature/home/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/filters.dart';
import '../widgets/merchant_order_items_grid_view.dart';

class MerchantHomeView extends StatelessWidget {
  const MerchantHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SearchField()),
        SliverGap(20),
        SliverToBoxAdapter(child: Filters()),
        SliverGap(20),
        MerchantOrderItemsGridView(),
      ],
    );
  }
}


