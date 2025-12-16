import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AcceptOrderButton extends StatelessWidget {
  const AcceptOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "merchant.accept_order".tr(),
      width: 180,
      textStyle: AppFontStyle.bold14White(context),
      onTap: () {},
    );
  }
}
