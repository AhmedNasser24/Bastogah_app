import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add your statistics widgets here
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
      ],
    );
  }
}
