import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import 'driver_report_bar_chart.dart';
import 'driver_report_filter.dart';

class DriverIncomeSection extends StatelessWidget {
  const DriverIncomeSection({super.key});

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
        const DriverReportFilter(),
        const Gap(0),
        const Center(child: DriverReportBarChart()),
      ],
    );
  }
}
