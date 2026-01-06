import 'package:bastogah_app/core/enums/roles_enum.dart';
import 'package:bastogah_app/core/flutter_toast/show_toast.dart';
import 'package:bastogah_app/core/local_storage_services/shared_preference_singleton.dart';
import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/models/login_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../manager/merchant_login_cubit/merchant_login_cubit.dart';

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
    return BlocConsumer<MerchantLoginCubit, MerchantLoginState>(
      listener: (context, state) {
        if (state is MerchantLoginFailure) {
          showErrorToast(state.errMessage);
        } else if (state is MerchantLoginSuccess) {
          showSuccessToast('auth.login_successful'.tr());
          context.go(RouteName.merchantHome);
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'auth.login'.tr(),
          isLoading: state is MerchantLoginLoading,
          onTap: () {
            if (formKey.currentState!.validate()) {
              RolesEnum role = RolesEnum.values.firstWhere(
                (e) => e.title == SharedPreferenceSingleton.getString(kRole),
              );
              switch (role) {
                case RolesEnum.merchant:
                  BlocProvider.of<MerchantLoginCubit>(
                    context,
                  ).login(loginModel.username!, loginModel.password!);
                case RolesEnum.driver:
                  context.go(RouteName.driverHome);
                case RolesEnum.customer:
                  context.go(RouteName.userHome);
              }
              // BlocProvider.of<MerchantLoginCubit>(
              //   context,
              // ).login(loginModel.username!, loginModel.password!);
            }
          },
        );
      },
    );
  }
}
