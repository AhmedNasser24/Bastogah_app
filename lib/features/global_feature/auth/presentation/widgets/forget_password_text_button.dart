import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          context.go(RouteName.forgotPassword);
        },
        child: Text(
          'auth.forget_password'.tr(),
          style: AppFontStyle.regular16black1A(context),
        ),
      ),
    );
  }
}
