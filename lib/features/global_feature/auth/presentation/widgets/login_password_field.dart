import 'package:bastogah_app/core/models/login_model.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_icons.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({super.key, required this.loginModel});
  final LoginModel loginModel;
  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "merchant.password_hint".tr(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.iconsLockIcon),
      ),
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: obscureText
            ? const Icon(Icons.visibility_off, size: 24, color: AppColors.grey)
            : const Icon(Icons.visibility, size: 24, color: AppColors.grey),
      ),
      onChanged: (value) {
        widget.loginModel.password = value;
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
