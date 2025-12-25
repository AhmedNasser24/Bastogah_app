import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          children: [
            Text(
              "merchant.monthly_statistics".tr(),
              style: AppFontStyle.bold18Primary(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            CustomButton(
              title: "الشهر الحالي",
              textStyle: AppFontStyle.medium14black4B(context),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.black4B,
                size: 28,
              ),
              color: AppColors.whiteF5,
              borderRadius: 8,
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: customStatisticsTile(
                context,
                title: "merchant.orders".tr(),
                value: "4,598",
                iconPath: AppIcons.iconsReportOrder,
              ),
            ),
            Expanded(
              child: customStatisticsTile(
                context,
                title: "merchant.delivery_payments".tr(),
                value: "25,024",
                iconPath: AppIcons.iconsReportTransactionExpense,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: customStatisticsTile(
                context,
                title: "merchant.daily_order_rate".tr(),
                value: "200",
                iconPath: AppIcons.iconsReportRating,
              ),
            ),
            Expanded(
              child: customStatisticsTile(
                context,
                title: "merchant.customer_ratings".tr(),
                value: "4.5",
                iconPath: AppIcons.iconsReportStar,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget customStatisticsTile(
    BuildContext context, {
    required String title,
    required String value,
    required String iconPath,
  }) {
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        style: AppFontStyle.regular12black4B(context),
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                SvgPicture.asset(iconPath),
              ],
            ),
            Text(value, style: AppFontStyle.bold24Black4B(context)),
          ],
        ),
      ),
    );
  }
}
