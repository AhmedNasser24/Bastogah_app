import 'package:bastogah_app/features/merchant_feature/products/presentation/widgets/merchant_product_item.dart';
import 'package:flutter/material.dart';

class MerchantProductItemsGridView extends StatelessWidget {
  const MerchantProductItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 700,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        mainAxisExtent: 70,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => const MerchantProductItem(),
    );
  }
}
