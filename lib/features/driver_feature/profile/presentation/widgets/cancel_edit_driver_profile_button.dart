import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CancelEditDriverProfileButton extends StatelessWidget {
  const CancelEditDriverProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "cancel".tr(),
      textStyle: AppFontStyle.medium14black1A(context),
      color: AppColors.white,
      borderColor: AppColors.lightGrey,
    );
  }
}
