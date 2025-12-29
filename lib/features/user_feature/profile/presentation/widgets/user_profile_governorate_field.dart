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

class UserProfileGovernorateField extends StatefulWidget {
  const UserProfileGovernorateField({super.key});

  @override
  State<UserProfileGovernorateField> createState() =>
      _UserProfileGovernorateFieldState();
}

class _UserProfileGovernorateFieldState
    extends State<UserProfileGovernorateField> {
  bool showDialog = false;
  final GlobalKey _buttonKey = GlobalKey();
  TextEditingController controller = TextEditingController(text: "بغداد");
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
        titleStyle: AppFontStyle.regular16grey(context),
        titlePrefixIcon: SvgPicture.asset(AppIcons.iconsAuthPin20Grey),
        hintText: 'merchant.select_governorate'.tr(),

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
