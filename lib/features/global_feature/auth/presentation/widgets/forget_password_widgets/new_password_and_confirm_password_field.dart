import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';

class NewPasswordAndConfirmPasswordField extends StatefulWidget {
  const NewPasswordAndConfirmPasswordField({super.key});

  @override
  State<NewPasswordAndConfirmPasswordField> createState() =>
      _NewPasswordAndConfirmPasswordFieldState();
}

class _NewPasswordAndConfirmPasswordFieldState
    extends State<NewPasswordAndConfirmPasswordField> {
  bool obscure1 = true, obscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "auth.new_password".tr(),
          obscureText: obscure1,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.iconsLockIcon),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure1 ? Icons.visibility_off : Icons.visibility,
              size: 24,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                obscure1 = !obscure1;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'validation.required_field'.tr();
            }
            return null;
          },
        ),
        const Gap(10),
        CustomTextFormField(
          hintText: "auth.confirm_password".tr(),
          obscureText: obscure2,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.iconsLockIcon),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure2 ? Icons.visibility_off : Icons.visibility,
              size: 24,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                obscure2 = !obscure2;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'validation.required_field'.tr();
            }
            return null;
          },
        ),
      ],
    );
  }
}
