import 'dart:developer' as dev;
import 'dart:math';

import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/dialog/custom_button_to_show_overlay_dialog.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class UserProfileCityField extends StatefulWidget {
  const UserProfileCityField({super.key});

  @override
  State<UserProfileCityField> createState() => _UserProfileCityFieldState();
}

class _UserProfileCityFieldState extends State<UserProfileCityField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  List<String> cities = [
    "بغداد",
    "البصرة",
    "الموصل",
    "أربيل",
    "النجف",
    "كربلاء",
    "السليمانية",
    "دهوك",
    "الأنبار",
  ];
  TextEditingController controller = TextEditingController(text: "حارثية");
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
          dev.log('showGovernerateDialog: $showDialog');
        },
        readOnly: true,
        title: "merchant.city".tr(),
        titleStyle: AppFontStyle.regular16grey(context),
        hintText: 'merchant.select_city'.tr(),
        titlePrefixIcon: SvgPicture.asset(AppIcons.iconsAuthCity20Grey),
        suffixIcon: Transform.rotate(
          angle: pi / 2,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
