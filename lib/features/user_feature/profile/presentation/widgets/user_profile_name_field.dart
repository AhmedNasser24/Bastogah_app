import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class UserProfileNameField extends StatefulWidget {
  const UserProfileNameField({super.key, required this.name});
  final String name;
  @override
  State<UserProfileNameField> createState() => _UserProfileNameFieldState();
}

class _UserProfileNameFieldState extends State<UserProfileNameField> {
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.name);
  }

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
