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
  TextEditingController controller = TextEditingController();
  List<String> cities = [
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
        for (int i = 0; i < cities.length; i++)
          InkWell(
            onTap: () {
              controller.text = cities[i];
              setState(() {
                showDialog = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Text(
                    cities[i],
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
