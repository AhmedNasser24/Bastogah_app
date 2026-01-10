import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/forget_password_text_button.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/login_password_field.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/merchant_driver_login_user_name_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/login_model.dart';
import '../../../../../core/widgets/custom_toast/custom_toastification.dart';
import '../widgets/do_not_have_account_button.dart';
import '../widgets/login_button.dart';
import '../widgets/need_help_button.dart';
import '../widgets/or_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginModel loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
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
                      MerchantDriverLoginUserNameField(loginModel: loginModel),
                      const Gap(8),
                      LoginPasswordField(loginModel: loginModel),
                      const ForgetPasswordTextButton(),
                      const Gap(30),
                      LoginButton(formKey: formKey, loginModel: loginModel),
                      const Gap(10),
                      const DoNotHaveAccountButton(),
                      const Gap(30),
                      const OrText(),
                      const Gap(40),
                      const NeedHelpButton(),
                      const Gap(30),
                      TextButton(
                        onPressed: () {
                          CustomToastification.showSuccessToast(
                            context: context,
                            message: "Operation completed successfully",
                          );
                        },
                        child: const Text("show success message"),
                      ),
                      TextButton(
                        onPressed: () {
                          CustomToastification.showFailureToast(
                            context: context,
                            message: "Operation failed",
                          );
                        },
                        child: const Text("show Failure message"),
                      ),
                      TextButton(
                        onPressed: () {
                          CustomToastification.showNotificationToast(
                            context: context,
                            message: "New update available",
                          );
                        },
                        child: const Text("show Notification message"),
                      ),
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
