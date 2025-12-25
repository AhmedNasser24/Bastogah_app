import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class DriverProfileNameField extends StatefulWidget {
  const DriverProfileNameField({super.key});

  @override
  State<DriverProfileNameField> createState() => _DriverProfileNameFieldState();
}

class _DriverProfileNameFieldState extends State<DriverProfileNameField> {
  final TextEditingController controller = TextEditingController(
    text: "شاورما كورنر",
  );
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "merchant.profile.full_name".tr(),
      titleStyle: AppFontStyle.regular16grey(context),
    );
  }
}
