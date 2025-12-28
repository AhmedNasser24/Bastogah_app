import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverRefusedOrderButton extends StatelessWidget {
  const DriverRefusedOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "driver.cancel_order".tr(),
      textStyle: AppFontStyle.medium16Red(context),
      prefixIcon: SvgPicture.asset(AppIcons.iconsCancelIcon),
      color: AppColors.whiteF5,
      onTap: () {},
    );
  }
}
