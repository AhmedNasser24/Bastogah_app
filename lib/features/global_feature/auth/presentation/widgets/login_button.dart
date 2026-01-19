import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/enums/roles_enum.dart';
import '../../../../../core/global/global_index.dart';
import '../../../../../core/models/login_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../manager/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.loginModel,
  });
  final GlobalKey<FormState> formKey;
  final LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          CustomFlutterToast.showErrorToast(state.errMessage);
        } else if (state is LoginSuccess) {
          CustomFlutterToast.showSuccessToast('auth.login_successful'.tr());
          switch (state.role) {
            case RoleEnum.merchant:
              context.go(RouteName.merchantHome);
            case RoleEnum.driver:
              context.go(RouteName.driverHome);
            case RoleEnum.client:
              context.go(RouteName.userHome);
          }
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'auth.login'.tr(),
          isLoading: state is LoginLoading,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<LoginCubit>(
                context,
              ).login(loginModel.username!, loginModel.password!);
            }
          },
        );
      },
    );
  }
}
