import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddAnotherCategoryButton extends StatelessWidget {
  const AddAnotherCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "merchant.profile.add_another_category".tr(),
      textStyle: AppFontStyle.semibold16black4B(context),
      prefixIcon: const Icon(Icons.add, color: AppColors.black4B, size: 24),
      onTap: () {},
      color: const Color(0xfff5f5f5),
    );
  }
}
