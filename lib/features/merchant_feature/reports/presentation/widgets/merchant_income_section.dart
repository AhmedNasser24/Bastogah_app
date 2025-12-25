import 'package:bastogah_app/features/merchant_feature/reports/presentation/widgets/merchant_report_bar_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import 'merchant_report_filter.dart';

class MerchantIncomeSection extends StatelessWidget {
  const MerchantIncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.reports.income".tr(),
          style: AppFontStyle.bold18Black1A(context),
        ),
        const MerchantReportFilter(),
        const Gap(0),
        const Center(child: MerchantReportBarChart()),
      ],
    );
  }
}
