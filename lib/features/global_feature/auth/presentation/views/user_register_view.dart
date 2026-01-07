import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/global_feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/login_model.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/already_have_account_button.dart';
import '../widgets/register_widgets/register_button.dart';
import '../widgets/register_widgets/register_city_field.dart';
import '../widgets/register_widgets/register_full_name_field.dart';
import '../widgets/register_widgets/register_governorate_field.dart';
import '../widgets/register_widgets/register_password_field.dart';
import '../widgets/register_widgets/register_phone_field.dart';
import '../widgets/register_widgets/user_register_terms_and_conditions.dart';

class UserRegisterView extends StatefulWidget {
  const UserRegisterView({super.key});

  @override
  State<UserRegisterView> createState() => _UserRegisterViewState();
}

class _UserRegisterViewState extends State<UserRegisterView> {
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
                      const Gap(10),
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: BackArrowButton(),
                      ),
                      const Gap(20),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "auth.user_register_title".tr(),
                          style: AppFontStyle.semibold20black1A(context),
                        ),
                      ),
                      const Gap(30),
                      const RegisterFullNameField(),
                      const Gap(8),
                      const RegisterPhoneField(),
                      const Gap(8),
                      const RegisterGovernorateField(),
                      const Gap(8),
                      const RegisterCityField(),
                      const Gap(8),
                      const RegisterPasswordField(),
                      const Gap(8),
                      const UserRegisterTermsAndConditions(),
                      const Gap(30),
                      RegisterButton(formKey: formKey),
                      const Gap(10),
                      const AlreadyHaveAccountButton(),
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
