// import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
// import 'package:bastogah_app/core/theme/app_font_style.dart';
// import 'package:bastogah_app/core/theme/app_images.dart';
// import 'package:bastogah_app/features/global_feature/auth/presentation/manager/merchant_login_cubit/merchant_login_cubit.dart';
// import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/forget_password_text_button.dart';
// import 'package:bastogah_app/features/global_feature/auth/presentation/widgets/login_password_field.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';

// import '../../../../../core/models/login_model.dart';
// import '../../../../../core/widgets/back_arrow_button.dart';
// import '../widgets/do_not_have_account_button.dart';
// import '../widgets/login_button.dart';
// import '../widgets/user_login_phone_field.dart';

// class UserLoginView extends StatefulWidget {
//   const UserLoginView({super.key});

//   @override
//   State<UserLoginView> createState() => _UserLoginViewState();
// }

// class _UserLoginViewState extends State<UserLoginView> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final LoginModel loginModel = LoginModel();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<LoginCubit>(),
//       child: Scaffold(
//         body: SafeArea(
//           child: Form(
//             key: formKey,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Center(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   constraints: const BoxConstraints(maxWidth: 1000),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Gap(20),
//                       Image.asset(AppImages.imagesLogoOrange),
//                       const Gap(10),
//                       const Align(
//                         alignment: AlignmentDirectional.centerStart,
//                         child: BackArrowButton(),
//                       ),
//                       const Gap(20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         spacing: 8,
//                         children: [
//                           Text(
//                             "auth.user_login_title".tr(),
//                             style: AppFontStyle.semibold20black1A(context),
//                           ),
//                           Text(
//                             "auth.user_login_subtitle".tr(),
//                             style: AppFontStyle.regular16black4B(context),
//                           ),
//                         ],
//                       ),
//                       const Gap(30),
//                       UserLoginPhoneField(loginModel: loginModel),
//                       const Gap(8),
//                       LoginPasswordField(loginModel: loginModel),
//                       const ForgetPasswordTextButton(),
//                       const Gap(30),
//                       LoginButton(formKey: formKey, loginModel: loginModel),
//                       const Gap(10),
//                       const DoNotHaveAccountButton(),
//                       const Gap(30),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
