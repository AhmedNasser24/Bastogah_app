import 'package:bastogah_app/features/user_feature/home/presentation/widgets/custom_slider.dart';
import 'package:bastogah_app/features/user_feature/user_layout/presentation/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_search_field.dart';
import '../widgets/sliver_list_of_user_product_items.dart';
import '../widgets/sliver_list_of_user_store_items.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserAppBar(address: "بغداد,العراق"),
        CustomSearchField(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverGap(16),
              SliverToBoxAdapter(child: CustomSlider()),
              SliverGap(16),
              // SliverListOfUserStoreItems(),
              SliverListOfUserProductItems(),
            ],
          ),
        ),
        // UserStoreItem(),
        // UserHomeProductItem(),
      ],
    );
  }
}
