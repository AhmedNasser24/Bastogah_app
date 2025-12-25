import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class DriverProfilePhoneField extends StatefulWidget {
  const DriverProfilePhoneField({super.key});

  @override
  State<DriverProfilePhoneField> createState() =>
      _DriverProfilePhoneFieldState();
}

class _DriverProfilePhoneFieldState extends State<DriverProfilePhoneField> {
  final TextEditingController controller = TextEditingController(
    text: "+962 7 1234 5678",
  );
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "merchant.profile.phone_number".tr(),
      titleStyle: AppFontStyle.regular16grey(context),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.end,
    );
  }
}
