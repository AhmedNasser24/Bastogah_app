import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';

class OrderSalarySectionForCart extends StatelessWidget {
  const OrderSalarySectionForCart({super.key});

  @override
  Widget build(BuildContext context) {
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
              "user.amount".tr(args: ["29500"]),
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
              "user.amount".tr(args: ["1500"]),
              style: AppFontStyle.semibold14black1A(context),
            ),
          ],
        ),
        const Gap(16),
        Row(
          children: [
            Text("user.total".tr(), style: AppFontStyle.bold16Black1A(context)),
            const Spacer(),
            Text(
              "user.amount".tr(args: ["31000"]),
              style: AppFontStyle.bold18Primary(context),
            ),
          ],
        ),
      ],
    );
  }
}
