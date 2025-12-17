import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_colors.dart';

class CurrentDues extends StatelessWidget {
  const CurrentDues({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.lightGrey, width: 1),
        ),
        child: Center(
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.iconsDollarIcon),
              Text("20,649 د.ع", style: AppFontStyle.bold18Black1A(context)),
              Text(
                "merchant.current_dues".tr(),
                style: AppFontStyle.regular12grey(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
