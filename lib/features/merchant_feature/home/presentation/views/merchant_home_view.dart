import 'package:bastogah_app/features/merchant_feature/home/presentation/widgets/home_widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/home_widgets/current_dues.dart';
import '../widgets/home_widgets/merchant_filters.dart';
import '../widgets/home_widgets/merchant_order_items_grid_view.dart';

class MerchantHomeView extends StatelessWidget {
  const MerchantHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CurrentDues()),
        SliverGap(20),
        SliverToBoxAdapter(child: SearchField()),
        SliverGap(20),
        SliverToBoxAdapter(child: MerchantFilters()),
        SliverGap(20),
        MerchantOrderItemsGridView(),
      ],
    );
  }
}
