import 'package:flutter/material.dart';

import '../../../../../../core/enums/driver_filter_enum.dart';
import 'driver_order_item.dart';

class DriverOrderItemsList extends StatelessWidget {
  const DriverOrderItemsList({super.key});

  final DriverFilterEnum selectedFilter = DriverFilterEnum.cancelled;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 800,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        mainAxisExtent: selectedFilter == DriverFilterEnum.cancelled
            ? 310
            : 230,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        // if (index == state.orders.length) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        return DriverOrderItem(currentStatus: selectedFilter.status);
      },
    );
  }
}
