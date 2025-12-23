import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/enums/merchant_filter_enums.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/back_arrow_button.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({
    super.key,
    required this.orderId,
    required this.status,
  });
  final String? orderId;
  final int status;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const BackArrowButton(),
          const Gap(10),
          Expanded(
            child: Text(
              "merchant.order_detail".tr(
                namedArgs: {"orderId": orderId ?? "--"},
              ),
              style: AppFontStyle.bold14black1A(context),
            ),
          ),
          // const Spacer(),
          orderStatuesWidget(context),
        ],
      ),
    );
  }

  Widget orderStatuesWidget(BuildContext context) {
    MerchantFilterEnum selectedFilter = MerchantFilterEnum.values[status];
    switch (selectedFilter) {
      case MerchantFilterEnum.pending:
        return orderStatueBackground(
          context,
          color: AppColors.yellow,
          text: "merchant.filter.pending".tr(),
        );
      case MerchantFilterEnum.waitingDriver:
        return orderStatueBackground(
          context,
          color: AppColors.purple,
          text: "merchant.filter.waiting_for_driver".tr(),
        );
      case MerchantFilterEnum.inprogress:
        return orderStatueBackground(
          context,
          color: AppColors.primary,
          text: "merchant.filter.in_progress".tr(),
        );
      case MerchantFilterEnum.completed:
        return orderStatueBackground(
          context,
          color: AppColors.green,
          text: "merchant.filter.completed".tr(),
        );
      case MerchantFilterEnum.cancelled:
        return orderStatueBackground(
          context,
          color: AppColors.red,
          text: "merchant.filter.cancelled".tr(),
        );
    }
  }

  Container orderStatueBackground(
    BuildContext context, {
    required Color color,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: AppFontStyle.bold14White(context).copyWith(color: color),
      ),
    );
  }
}
