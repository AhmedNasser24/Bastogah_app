import 'dart:developer' as dev;
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantAddNewOrderGovernorateField extends StatefulWidget {
  const MerchantAddNewOrderGovernorateField({super.key});

  @override
  State<MerchantAddNewOrderGovernorateField> createState() =>
      _MerchantAddNewOrderGovernorateFieldState();
}

class _MerchantAddNewOrderGovernorateFieldState
    extends State<MerchantAddNewOrderGovernorateField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  List<String> governorates = [
    "القاهرة",
    "الجيزة",
    "الإسكندرية",
    "الدقهلية",
    "الشرقية",
    "الغربية",
    "المنوفية",
    "البحيرة",
    "سوهاج",
  ];
  @override
  Widget build(BuildContext context) {
    return CustomButtonToShowOverlayDialog(
      showDialog: showDialog,
      buttonKey: _buttonKey,
      widgetListInDialog: [
        for (int i = 0; i < governorates.length; i++)
          InkWell(
            onTap: () {
              controller.text = governorates[i];
              setState(() {
                showDialog = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Text(
                    governorates[i],
                    style: AppFontStyle.regular16black1A(context),
                  ),
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
          dev.log('showGovernorateDialog: $showDialog');
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
