import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SaveEditProfileButton extends StatelessWidget {
  const SaveEditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "merchant.profile.save_changes".tr(),
    );
  }
}
