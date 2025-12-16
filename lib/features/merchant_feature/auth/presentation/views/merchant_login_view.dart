import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/merchant_password_field.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/merchant_user_name_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/merchant_login_button.dart';
import '../widgets/need_help_button.dart';
import '../widgets/or_text.dart';

class MerchantLoginView extends StatefulWidget {
  const MerchantLoginView({super.key});

  @override
  State<MerchantLoginView> createState() => _MerchantLoginViewState();
}

class _MerchantLoginViewState extends State<MerchantLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(20),
                  Image.asset(AppImages.imagesLogoOrange),
                  const Gap(8),
                  Text(
                    'merchant.welcome'.tr(),
                    style: AppFontStyle.bold30black1A(context),
                  ),
                  const Gap(30),
                  const MerchantUserNameField(),
                  const Gap(8),
                  const MerchantPasswordField(),
                  const ForgetPasswordTextButton(),
                  const Gap(30),
                  const MerchantLoginButton(),
                  const Gap(40),
                  const OrText(),
                  const Gap(40),
                  const NeedHelpButton(),
                  const Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
