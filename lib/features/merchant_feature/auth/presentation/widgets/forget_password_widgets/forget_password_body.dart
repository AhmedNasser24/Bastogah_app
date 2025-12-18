import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/app_font_style.dart';
import 'forget_password_phone_field.dart';
import 'send_otp_button.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

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
                  "auth.forget_password".tr(),
                  style: AppFontStyle.semibold20black1A(context),
                ),
                Text(
                  "auth.forget_password_subtitle".tr(),
                  style: AppFontStyle.regular14black4B(context),
                ),
              ],
            ),
            const Gap(30),
            const ForgetPasswordPhoneField(),
            const Gap(30),
            const SendOtpButton(),
            // const Gap(10),
            const RemembedPasswordWidget(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class RemembedPasswordWidget extends StatelessWidget {
  const RemembedPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "auth.remembered_password".tr(),
          style: AppFontStyle.regular14grey(context),
        ),
        TextButton(
          onPressed: () {
            context.go(RouteName.merchantLogin);
          },
          child: Text(
            "auth.login".tr(),
            style: AppFontStyle.regular14black1A(context),
          ),
        ),
      ],
    );
  }
}
