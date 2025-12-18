import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/core/widgets/back_arrow_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_font_style.dart';
import 'new_password_and_confirm_password_field.dart';
import 'remember_password_widget.dart';
import 'update_password_button.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key});
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
                  "auth.create_new_password".tr(),
                  style: AppFontStyle.semibold20black1A(context),
                ),
                Text(
                  "auth.create_new_password_subtitle".tr(),
                  style: AppFontStyle.regular16black4B(context),
                ),
              ],
            ),
            const Gap(30),
            const NewPasswordAndConfirmPasswordField(),
            const Gap(30),
            const UpdatePasswordButton(),
            // const Gap(10),
            const RemembedPasswordWidget(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
