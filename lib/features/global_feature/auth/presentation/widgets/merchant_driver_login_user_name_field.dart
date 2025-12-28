import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/models/login_model.dart';
import '../../../../../core/theme/app_icons.dart';

class MerchantDriverLoginUserNameField extends StatelessWidget {
  const MerchantDriverLoginUserNameField({super.key, required this.loginModel});
  final LoginModel loginModel;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "merchant.username_hint".tr(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.iconsUsernameIcon),
      ),
      onChanged: (value) {
        loginModel.username = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'validation.required_field'.tr();
        }
        return null;
      },
    );
  }
}
