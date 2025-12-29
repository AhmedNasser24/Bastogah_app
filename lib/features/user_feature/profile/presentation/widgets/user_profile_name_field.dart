import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class UserProfileNameField extends StatefulWidget {
  const UserProfileNameField({super.key});

  @override
  State<UserProfileNameField> createState() => _UserProfileNameFieldState();
}

class _UserProfileNameFieldState extends State<UserProfileNameField> {
  final TextEditingController controller = TextEditingController(
    text: "محمد احمد علي",
  );
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "merchant.profile.full_name".tr(),
      titlePrefixIcon: SvgPicture.asset(AppIcons.iconsUsernameIcon),
      titleStyle: AppFontStyle.regular16grey(context),
    );
  }
}
