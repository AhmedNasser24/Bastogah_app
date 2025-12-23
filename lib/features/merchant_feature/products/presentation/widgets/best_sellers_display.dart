import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import 'custom_check_box.dart';

class BestSellersDisplay extends StatelessWidget {
  const BestSellersDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          "merchant.most_popular".tr(),
          style: AppFontStyle.semibold14black4B(context),
        ),
        Row(
          children: [
            const CustomCheckBox(),
            const Gap(8),
            Text("yes".tr(), style: AppFontStyle.regular14black4B(context)),
          ],
        ),
      ],
    );
  }
}
