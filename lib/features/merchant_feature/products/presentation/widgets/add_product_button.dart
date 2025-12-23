import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "merchant.add".tr(),
      prefixIcon: AppIcons.iconsCheckIcon,
    );
  }
}
