import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_icons.dart';

class RegisterFullNameField extends StatelessWidget {
  const RegisterFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "auth.full_name".tr(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.iconsPerson20Grey),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'validation.required_field'.tr();
        }
        return null;
      },
    );
  }
}
