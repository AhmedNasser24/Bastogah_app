import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/local_storage_data/local_storage_data.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../data/model/cart_model.dart';

class OrderSalarySectionForCart extends StatelessWidget {
  const OrderSalarySectionForCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalStorageData.cartsNotifier,
      builder: (context, carts, child) {
        return Column(
          children: [
            const Gap(12),
            Row(
              children: [
                Text(
                  "user.subtotal".tr(),
                  style: AppFontStyle.regular14black1A(context),
                ),
                const Spacer(),
                Text(
                  "user.amount".tr(args: ["${totalPrice(carts)}"]),
                  style: AppFontStyle.semibold14black1A(context),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  "user.delivery_fee".tr(),
                  style: AppFontStyle.regular14black1A(context),
                ),
                const Spacer(),
                Text(
                  "user.amount".tr(args: ["0"]),
                  style: AppFontStyle.semibold14black1A(context),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                Text(
                  "user.total".tr(),
                  style: AppFontStyle.bold16Black1A(context),
                ),
                const Spacer(),
                Text(
                  "user.amount".tr(args: ["${totalPrice(carts)}"]),
                  style: AppFontStyle.bold18Primary(context),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  int totalPrice(List<CartModel> carts) {
    int total = 0;
    for (var cart in carts) {
      total += cart.userProduct.finalPrice! * cart.quantity;
    }
    return total;
  }
}
