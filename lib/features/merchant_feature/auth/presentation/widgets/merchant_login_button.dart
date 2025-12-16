import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_button.dart';

class MerchantLoginButton extends StatelessWidget {
  const MerchantLoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'merchant.login'.tr(),
      onTap: () {
        if (formKey.currentState!.validate()) {
          context.go(RouteName.merchantLayout);
        }
      },
    );
  }
}
