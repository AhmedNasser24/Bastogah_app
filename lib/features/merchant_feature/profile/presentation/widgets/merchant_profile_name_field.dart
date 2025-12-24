import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class MerchantProfileNameField extends StatefulWidget {
  const MerchantProfileNameField({super.key});

  @override
  State<MerchantProfileNameField> createState() =>
      _MerchantProfileNameFieldState();
}

class _MerchantProfileNameFieldState extends State<MerchantProfileNameField> {
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
