import 'package:flutter/material.dart';

import 'user_home_product_item.dart';

class SliverListOfUserProductItems extends StatelessWidget {
  const SliverListOfUserProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        maxCrossAxisExtent: 600,
        mainAxisExtent: 140,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const UserHomeProductItem();
      },
    );
  }
}
