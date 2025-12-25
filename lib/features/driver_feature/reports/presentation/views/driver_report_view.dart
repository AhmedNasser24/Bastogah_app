import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/driver_income_section.dart';
import '../widgets/driver_statistics_section.dart';

class DriverReportsView extends StatelessWidget {
  const DriverReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MerchantAppBar(title: "merchant.reports".tr()),
        const Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                DriverIncomeSection(),
                Gap(24),
                DriverStatisticsSection(),
                Gap(16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
