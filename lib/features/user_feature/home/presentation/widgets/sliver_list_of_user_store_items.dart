import 'package:flutter/material.dart';

import '../../../favourites/presentation/widgets/user_store_item.dart';

class SliverListOfUserStoreItems extends StatelessWidget {
  const SliverListOfUserStoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        maxCrossAxisExtent: 600,
        mainAxisExtent: 300,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const UserStoreItem();
      },
    );
  }
}
