import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class MerchantProfileStoreKindField extends StatefulWidget {
  const MerchantProfileStoreKindField({super.key});

  @override
  State<MerchantProfileStoreKindField> createState() =>
      _MerchantProfileStoreKindFieldState();
}

class _MerchantProfileStoreKindFieldState
    extends State<MerchantProfileStoreKindField> {
  final TextEditingController controller = TextEditingController(text: "مطعم");
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "merchant.profile.store_kind".tr(),
      titleStyle: AppFontStyle.regular16grey(context),
    );
  }
}
