import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';

class CodeDiscountField extends StatelessWidget {
  const CodeDiscountField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
            ),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.iconsCodeDiscountIcon),
              const Gap(10),
              Text(
                "user.discount_code".tr(),
                style: AppFontStyle.bold14White(context),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "user.enter_discount_code".tr(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const Gap(8),
              CustomButton(
                title: "user.apply".tr(),
                width: 100,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
