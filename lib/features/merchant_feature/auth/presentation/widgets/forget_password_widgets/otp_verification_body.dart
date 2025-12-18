import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/forget_password_widgets/confirm_otp_button.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_font_style.dart';
import 'forget_password_phone_field.dart';
import 'remember_password_widget.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});
  final String phoneNumber = "+964 7700 123456";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Gap(20),
            Image.asset(AppImages.imagesLogoOrange),
            const Gap(10),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: BackArrowButton(),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                Text(
                  "auth.enter_otp".tr(),
                  style: AppFontStyle.semibold20black1A(context),
                ),
                Text(
                  "auth.enter_otp_subtitle".tr(),
                  style: AppFontStyle.regular16black4B(context),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    phoneNumber,
                    style: AppFontStyle.semibold16black4B(context),
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            const Gap(30),
            const ForgetPasswordPhoneField(),
            const Gap(30),
            const ConfirmOtpButton(),
            // const Gap(10),
            const RemembedPasswordWidget(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
