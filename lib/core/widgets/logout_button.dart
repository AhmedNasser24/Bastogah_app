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
      onTap: () {
        logoutDialog(context);
      },
      title: "auth.logout".tr(),
      textStyle: AppFontStyle.medium16Red(context),
      prefixIcon: SvgPicture.asset(AppIcons.iconsLogOut),
      borderColor: AppColors.lightGrey,
      color: AppColors.white,
      borderRadius: 12,
      borderWidth: 0.5,
    );
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "auth.logout_confirmation".tr(),
            style: AppFontStyle.bold16Black1A(context),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actionsPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "cancel".tr(),
                style: AppFontStyle.bold16Primary(context),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "auth.logout".tr(),
                style: AppFontStyle.medium16Red(context),
              ),
            ),
          ],
        );
      },
    );
  }
}
