import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class UserProfilePhoneField extends StatefulWidget {
  const UserProfilePhoneField({super.key, required this.phone});
  final String phone;
  @override
  State<UserProfilePhoneField> createState() => _UserProfilePhoneFieldState();
}

class _UserProfilePhoneFieldState extends State<UserProfilePhoneField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "merchant.profile.phone_number".tr(),
      titlePrefixIcon: SvgPicture.asset(AppIcons.iconsAuthPhone16GreyIcon),
      titleStyle: AppFontStyle.regular16grey(context),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.end,
    );
  }
}
