import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_button.dart';

class NeedHelpButton extends StatelessWidget {
  const NeedHelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'merchant.need_help'.tr(),
      textStyle: AppFontStyle.semibold14black4B(context),
      borderColor: AppColors.lightGrey,
      color: Colors.transparent,
      suffixIcon: AppIcons.iconsNeedHelpIcon,
      onTap: () {},
    );
  }
}
