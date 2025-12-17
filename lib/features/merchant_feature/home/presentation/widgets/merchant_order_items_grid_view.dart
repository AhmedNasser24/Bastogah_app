import 'package:flutter/widgets.dart';

import '../../../../../core/enums/merchant_filter_enums.dart';
import 'merchant_order_item.dart';

class MerchantOrderItemsGridView extends StatelessWidget {
  const MerchantOrderItemsGridView({super.key});

  final MerchantFilterEnums selectedFilter = MerchantFilterEnums.cancelled;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 800,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        mainAxisExtent: selectedFilter == MerchantFilterEnums.cancelled
            ? 310
            : 235,
      ),
      itemCount: 20,
      itemBuilder: (context, index) =>
          MerchantOrderItem(selectedFilter: selectedFilter),
    );
  }
}
