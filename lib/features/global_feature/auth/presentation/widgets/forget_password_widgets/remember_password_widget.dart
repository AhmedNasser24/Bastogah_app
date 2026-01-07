import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routing/route_name.dart';
import '../../../../../../core/theme/app_font_style.dart';

class RemembedPasswordWidget extends StatelessWidget {
  const RemembedPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "auth.remembered_password".tr(),
          style: AppFontStyle.regular14grey(context),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(4)),
          onPressed: () {
            context.go(RouteName.login);
          },
          child: Text(
            "auth.login".tr(),
            style: AppFontStyle.regular14black1A(context),
          ),
        ),
      ],
    );
  }
}
