import 'package:flutter/material.dart';

import '../widgets/user_favourite_app_bar.dart';
import '../widgets/user_favourite_item.dart';

class UserFavouriteView extends StatelessWidget {
  const UserFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserFavouriteAppBar(),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              maxCrossAxisExtent: 600,
              mainAxisExtent: 290,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const UserFavouriteItem();
            },
          ),
        ),
      ],
    );
  }
}
