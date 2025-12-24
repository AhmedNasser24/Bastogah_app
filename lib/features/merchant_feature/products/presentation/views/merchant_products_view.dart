import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../../../../core/widgets/custom_floating_action_button.dart';
import '../../../merchant_layout/presentation/widgets/merchant_app_bar.dart';
import '../widgets/merchant_filters_for_products.dart';
import '../widgets/merchant_product_items_grid_view.dart';

class MerchantProductsView extends StatelessWidget {
  const MerchantProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MerchantAppBar(title: "merchant.products".tr()),
          const Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: CustomSearchField()),
                SliverGap(12),
                SliverToBoxAdapter(child: MerchantFiltersForProducts()),
                SliverGap(20),
                MerchantProductItemsGridView(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          context.push(
            RouteName.merchantAddOrEditProduct,
            extra: false,
          ); // add product
        },
      ),
    );
  }
}
