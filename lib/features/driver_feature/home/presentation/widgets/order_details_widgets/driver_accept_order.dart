import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class DriverAcceptOrderButton extends StatelessWidget {
  const DriverAcceptOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "driver.accept_order".tr(),
      textStyle: AppFontStyle.bold14White(context),
      onTap: () {},
    );
  }
}
