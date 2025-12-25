// import 'package:flutter/material.dart';

// import '../../../../../../core/enums/merchant_filter_enums.dart';
// import '../../manager/cubit/merchant_get_orders_cubit.dart';
// import 'merchant_order_item.dart';

// class MerchantOrderItemsGridPagination extends StatelessWidget {
//   const MerchantOrderItemsGridPagination({super.key, required this.state});

//   final GetOrdersSuccessFull state;

//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.builder(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 800,
//         mainAxisSpacing: 0,
//         crossAxisSpacing: 0,
//         mainAxisExtent:
//             state.currentStatus == MerchantFilterEnum.cancelled.status
//             ? 310
//             : 230,
//       ),
//       itemCount: state.orders.length + (state.moreItem ? 1 : 0),
//       itemBuilder: (context, index) {
//         if (index == state.orders.length) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return MerchantOrderItem(
//           currentStatus: state.currentStatus,
//           order: state.orders[index],
//         );
//       },
//     );
//   }
// }
