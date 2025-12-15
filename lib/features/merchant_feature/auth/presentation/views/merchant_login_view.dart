import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/merchant_password_field.dart';
import 'package:bastogah_app/features/merchant_feature/auth/presentation/widgets/merchant_user_name_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/merchant_login_button.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(20),
                  Image.asset(AppImages.imagesLogoOrange),
                  Gap(8),
                  Text(
                    'merchant.welcome'.tr(),
                    style: AppFontStyle.bold30black1A(context),
                  ),
                  Gap(30),
                  MerchantUserNameField(),
                  Gap(8),
                  MerchantPasswordField(),
                  ForgetPasswordTextButton(),
                  Gap(30),
                  MerchantLoginButton(),
                  Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
