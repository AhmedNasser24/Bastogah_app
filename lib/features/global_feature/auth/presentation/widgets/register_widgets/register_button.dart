import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'auth.sign_up'.tr(),
      isLoading: false,
      onTap: () {
        if (formKey.currentState!.validate()) {}
      },
    );
  }
}
