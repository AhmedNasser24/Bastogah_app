import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/manager/merchant_login_cubit/merchant_login_cubit.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/merchant_password_field.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/merchant_driver_user_name_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/login_model.dart';
import '../widgets/login_button.dart';
import '../widgets/need_help_button.dart';
import '../widgets/or_text.dart';

class MerchantAndDriverLoginView extends StatefulWidget {
  const MerchantAndDriverLoginView({super.key});

  @override
  State<MerchantAndDriverLoginView> createState() =>
      _MerchantAndDriverLoginViewState();
}

class _MerchantAndDriverLoginViewState
    extends State<MerchantAndDriverLoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginModel loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MerchantLoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

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
                      MerchantDriverUserNameField(loginModel: loginModel),
                      const Gap(8),
                      MerchantPasswordField(loginModel: loginModel),
                      const ForgetPasswordTextButton(),
                      const Gap(30),
                      LoginButton(formKey: formKey, loginModel: loginModel),
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
        ),
      ),
    );
  }
}
