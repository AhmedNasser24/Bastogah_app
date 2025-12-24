import 'package:bastogah_app/features/merchant_feature/merchant_layout/presentation/widgets/merchant_app_bar.dart';
import 'package:bastogah_app/features/merchant_feature/reports/presentation/widgets/bar_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MerchantReportsView extends StatelessWidget {
  const MerchantReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MerchantAppBar(title: "merchant.reports".tr()),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(children: [Gap(20), MerchantBarChart()]),
          ),
        ),
      ],
    );
  }
}
