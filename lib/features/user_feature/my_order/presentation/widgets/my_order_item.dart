import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/features/user_feature/my_order/presentation/widgets/custom_expansion_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../data/models/user_order_model.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, this.order});
  final UserOrderModel? order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppIcons.iconsCalenderIcon),
                const Gap(8),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "15 أكتوبر, 02:37م",
                        style: AppFontStyle.regular14grey(context),
                      ),
                    ),
                  ),
                ),
                const Gap(4),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    "user.received".tr(),
                    style: AppFontStyle.semibold12green(context),
                  ),
                ),
              ],
            ),
            CustomExpansionTile(order: order),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Flexible(child: MyOrderBuyAgainButton()),
                  // const Gap(4),
                  const Spacer(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "user.total_amount".tr(
                        args: [order?.itemsPrice?.toString() ?? '--'],
                      ),
                      style: AppFontStyle.semibold14black4B(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
