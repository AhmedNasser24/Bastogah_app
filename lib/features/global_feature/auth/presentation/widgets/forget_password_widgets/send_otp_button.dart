import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/widgets/custom_button.dart';

class SendOtpButton extends StatelessWidget {
  const SendOtpButton({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "auth.send_otp".tr(),
      textStyle: AppFontStyle.semibold16White(context),
      onTap: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
