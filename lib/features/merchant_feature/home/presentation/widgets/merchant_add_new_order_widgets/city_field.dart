import 'dart:developer' as dev;
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class CityField extends StatefulWidget {
  const CityField({super.key});

  @override
  State<CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  bool showCityDialog = false;
  final GlobalKey _cityButtonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomButtonToShowOverlayDialog(
      showDialog: showCityDialog,
      buttonKey: _cityButtonKey,
      widgetListInDialog: [
        for (int i = 0; i < 9; i++)
          InkWell(
            onTap: () {
              setState(() {
                showCityDialog = false;
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
        key: _cityButtonKey,
        onTap: () {
          setState(() {
            showCityDialog = true;
          });
          dev.log('showCityDialog: $showCityDialog');
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
