import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/helper/get_order_statues.dart';
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
    String statusText;
    Color statusColor;
    var orderStatues = getOrderStatues(status);
    statusText = orderStatues.$1;
    statusColor = orderStatues.$2;
    return orderStatueBackground(context, color: statusColor, text: statusText);
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
