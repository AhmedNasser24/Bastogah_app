import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class ConfirmOtpButton extends StatelessWidget {
  const ConfirmOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "auth.confirm_otp".tr(),
      textStyle: AppFontStyle.semibold16White(context),
      onTap: () {},
    );
  }
}
