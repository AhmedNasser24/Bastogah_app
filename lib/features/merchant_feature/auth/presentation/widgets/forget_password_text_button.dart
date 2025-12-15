import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'merchant.forget_password'.tr(),
          style: AppFontStyle.regular16black1A(context),
        ),
      ),
    );
  }
}
