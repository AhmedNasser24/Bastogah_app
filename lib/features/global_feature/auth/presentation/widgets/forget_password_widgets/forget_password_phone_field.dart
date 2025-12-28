import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/theme/app_icons.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordPhoneField extends StatelessWidget {
  const ForgetPasswordPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "auth.phone_number".tr(),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.iconsForgetPasswordPhoneIcon),
      ),
      suffixIcon: SizedBox(
        width: 45,
        child: Center(
          child: Text("964+", style: AppFontStyle.regular14black4B(context)),
        ),
      ),
    );
  }
}
