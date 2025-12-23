import 'dart:developer' as dev;
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class GovernorateField extends StatefulWidget {
  const GovernorateField({super.key});

  @override
  State<GovernorateField> createState() => _GovernorateFieldState();
}

class _GovernorateFieldState extends State<GovernorateField> {
  bool showGovernorateDialog = false;
  final GlobalKey _governorateButtonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomButtonToShowOverlayDialog(
      showDialog: showGovernorateDialog,
      buttonKey: _governorateButtonKey,
      widgetListInDialog: [
        for (int i = 0; i < 9; i++)
          InkWell(
            onTap: () {
              setState(() {
                showGovernorateDialog = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Text("السويس", style: AppFontStyle.regular16black1A(context)),
                ],
              ),
            ),
          ),
      ],
      mainWidget: CustomTextFormField(
        key: _governorateButtonKey,
        onTap: () {
          setState(() {
            showGovernorateDialog = true;
          });
          dev.log('showGovernorateDialog: $showGovernorateDialog');
        },
        title: 'merchant.governorate'.tr(),
        hintText: 'merchant.select_governorate'.tr(),
        readOnly: true,
        suffixIcon: Transform.rotate(
          angle: pi / 2,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
