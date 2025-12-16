import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_icons.dart';

class MerchantUserNameField extends StatelessWidget {
  const MerchantUserNameField({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "merchant.username_hint".tr(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.iconsUsernameIcon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'validation.required_field'.tr();
        }
        return null;
      },
    );
  }
}
