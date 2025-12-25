import 'package:bastogah_app/features/merchant_feature/reports/presentation/widgets/report_bar_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_font_style.dart';
import 'report_filter.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.reports.income".tr(),
          style: AppFontStyle.bold18Black1A(context),
        ),
        const ReportFilter(),
        const MerchantReportBarChart(),
      ],
    );
  }
}
