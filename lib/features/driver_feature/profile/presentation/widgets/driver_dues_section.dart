import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';

class DuesSection extends StatelessWidget {
  const DuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFFFBF7F),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  "driver.dues".tr(),
                  style: AppFontStyle.regular14White(context),
                ),
                Text("25,582", style: AppFontStyle.bold36White(context)),
                Text(
                  "driver.currency".tr(),
                  style: AppFontStyle.regular14White(context),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -40,
          top: -40,
          child: SvgPicture.asset(AppIcons.iconsWalletContainer),
        ),
        Positioned(
          left: -55,
          bottom: -75,
          child: SvgPicture.asset(AppIcons.iconsWalletContainer),
        ),
      ],
    );
  }
}
