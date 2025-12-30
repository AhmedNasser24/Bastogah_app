import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserAddNewAddressButton extends StatelessWidget {
  const UserAddNewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "user.add_address".tr(),
      textStyle: AppFontStyle.semibold16White(context),
    );
  }
}
