import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_name.dart';
import '../../../../../core/theme/app_font_style.dart';

class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "auth.do_not_have_account".tr(),
          style: AppFontStyle.regular14grey(context),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(4)),
          onPressed: () {
            context.go(RouteName.merchantAndDriverLogin);
          },
          child: Text(
            "auth.sign_up".tr(),
            style: AppFontStyle.regular14black1A(context),
          ),
        ),
      ],
    );
  }
}
