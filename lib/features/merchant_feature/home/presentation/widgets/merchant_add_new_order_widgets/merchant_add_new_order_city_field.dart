import 'dart:developer' as dev;
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class MerchantAddNewOrderCityField extends StatefulWidget {
  const MerchantAddNewOrderCityField({super.key});

  @override
  State<MerchantAddNewOrderCityField> createState() =>
      _MerchantAddNewOrderCityFieldState();
}

class _MerchantAddNewOrderCityFieldState
    extends State<MerchantAddNewOrderCityField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
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
        onTap: () {
          setState(() {
            showDialog = true;
          });
          dev.log('showCityDialog: $showDialog');
        },
        readOnly: true,
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
    );
  }
}
