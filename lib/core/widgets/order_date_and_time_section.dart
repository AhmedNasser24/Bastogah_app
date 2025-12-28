import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../theme/app_font_style.dart';

class OrderDateAndTimeSection extends StatelessWidget {
  const OrderDateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.iconsCalenderIcon),
              const Gap(8),
              Text("25-12-2023", style: AppFontStyle.regular14grey(context)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.iconsTimeGreyIcon),
              const Gap(8),
              Text("02:30 مساءا", style: AppFontStyle.regular14grey(context)),
            ],
          ),
        ),
      ],
    );
  }
}
