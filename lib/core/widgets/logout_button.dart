import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "auth.logout".tr(),
      textStyle: AppFontStyle.medium16Red(context),
      prefixIcon: SvgPicture.asset(AppIcons.iconsLogOut),
      borderColor: AppColors.lightGrey,
      color: AppColors.white,
      borderRadius: 12,
      borderWidth: 0.5,
    );
  }
}
