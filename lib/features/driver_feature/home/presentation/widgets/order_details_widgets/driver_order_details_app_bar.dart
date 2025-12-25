import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/enums/driver_filter_enum.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/back_arrow_button.dart';

class DriverOrderDetailsAppBar extends StatelessWidget {
  const DriverOrderDetailsAppBar({
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
    DriverFilterEnum selectedFilter = DriverFilterEnum.values[status];
    switch (selectedFilter) {
      case DriverFilterEnum.pending:
        return orderStatueBackground(
          context,
          color: AppColors.yellow,
          text: "merchant.filter.pending".tr(),
        );

      case DriverFilterEnum.inDelivery:
        return orderStatueBackground(
          context,
          color: AppColors.primary,
          text: "merchant.filter.waiting_for_delivery".tr(),
        );
      case DriverFilterEnum.completed:
        return orderStatueBackground(
          context,
          color: AppColors.green,
          text: "merchant.filter.completed".tr(),
        );
      case DriverFilterEnum.cancelled:
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
