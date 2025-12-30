import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class UserAddNewAddressGovernorateField extends StatefulWidget {
  const UserAddNewAddressGovernorateField({super.key});

  @override
  State<UserAddNewAddressGovernorateField> createState() =>
      _UserAddNewAddressGovernorateFieldState();
}

class _UserAddNewAddressGovernorateFieldState
    extends State<UserAddNewAddressGovernorateField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomButtonToShowOverlayDialog(
      showDialog: showDialog,
      buttonKey: _buttonKey,
      widgetListInDialog: [
        for (int i = 0; i < 9; i++)
          InkWell(
            onTap: () {
              setState(() {
                showDialog = false;
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
        key: _buttonKey,
        controller: controller,
        onTap: () {
          setState(() {
            showDialog = true;
          });
          dev.log('showGovernerateDialog: $showDialog');
        },
        readOnly: true,
        title: "merchant.governorate".tr(),
        hintText: 'merchant.select_governorate'.tr(),
        suffixIcon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
