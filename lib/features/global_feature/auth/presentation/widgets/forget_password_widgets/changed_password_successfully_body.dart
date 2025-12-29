import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/app_font_style.dart';
import '../../../../../../core/theme/app_images.dart';
import '../../../../../../core/widgets/back_arrow_button.dart';

class ChangedPasswordSuccessfullyBody extends StatelessWidget {
  const ChangedPasswordSuccessfullyBody({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
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
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: BackArrowButton(onTap: () {}), // don't make pop action
            ),
            const Gap(20),
            Image.asset(AppImages.imagesChangePasswordSuccessfully),
            const Gap(30),
            Column(
              spacing: 8,
              children: [
                Text(
                  "auth.password_changed_successfully".tr(),
                  style: AppFontStyle.bold20Black1A(context),
                ),
                Text(
                  "auth.you_are_able_to_login_now".tr(),
                  style: AppFontStyle.regular16black4B(context),
                ),
              ],
            ),
            const Gap(30),
            CustomButton(
              title: "auth.login".tr(),
              onTap: () => context.push(
                RouteName.userLogin,
              ), // handle this according to role selection
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
