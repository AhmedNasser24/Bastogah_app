import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              appBar(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

                  child: Column(
                    spacing: 10,
                    children: [
                      const Gap(15),
                      profileTile(
                        context,
                        imagePath: AppIcons.iconsPrivacyProfileIcon,
                        title: "auth.change_password".tr(),
                        onTap: () {},
                      ),
                      profileTile(
                        context,
                        imagePath: AppIcons.iconsPrivacyProfileIcon,
                        title: "auth.two_factor_authentication".tr(),
                        onTap: () {},
                      ),

                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile(
    BuildContext context, {
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        color: AppColors.white,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,

                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                const Gap(8),
                Text(title, style: AppFontStyle.regular14black1A(context)),
                const Spacer(),
                SvgPicture.asset(AppIcons.iconsForwardIcon, fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(8),
            Text(
              "merchant.profile.privacy".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
