import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantAddressField extends StatelessWidget {
  const MerchantAddressField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          title: 'merchant.governorate'.tr(),
          hintText: 'merchant.select_governorate'.tr(),
          suffixIcon: Transform.rotate(
            angle: pi / 2,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColors.grey,
            ),
          ),
        ),
        CustomTextFormField(
          title: 'merchant.city'.tr(),
          hintText: 'merchant.select_city'.tr(),
          suffixIcon: Transform.rotate(
            angle: pi / 2,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
