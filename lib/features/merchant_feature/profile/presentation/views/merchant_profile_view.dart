import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/logout_button.dart';
import '../widgets/merchant_profile_info_section.dart';

class MerchantProfileView extends StatelessWidget {
  const MerchantProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

      child: Column(
        children: [
          const Gap(20),
          const MerchantProfileInfoSection(),
          const Gap(20),
          profileTile(
            context,
            imagePath: AppIcons.iconsProfileAdditionIcon,
            title: "merchant.profile.add_subcategories".tr(),
            onTap: () {
              context.push(RouteName.merchantAddSubCategories);
            },
          ),
          profileTile(
            context,
            imagePath: AppIcons.iconsFilterProfileIcon,
            title: "merchant.profile.add_product_categories".tr(),
            onTap: () {
              context.push(RouteName.merchantAddProductCategory);
            },
          ),
          profileTile(
            context,
            imagePath: AppIcons.iconsPersonProfileIcon,
            title: "merchant.profile.edit_profile".tr(),
            onTap: () {
              context.push(RouteName.merchantEditProfile);
            },
          ),
          profileTile(
            context,
            imagePath: AppIcons.iconsNotificationProfileIcon,
            title: "merchant.profile.notification".tr(),
            onTap: () {
              context.push(RouteName.merchantNotification);
            },
          ),
          profileTile(
            context,
            imagePath: AppIcons.iconsPrivacyProfileIcon,
            title: "merchant.profile.privacy".tr(),
            onTap: () {
              context.push(RouteName.merchantPrivacy);
            },
          ),
          profileTile(
            context,
            imagePath: AppIcons.iconsQuestionProfileIcon,
            title: "merchant.profile.help_support".tr(),
            onTap: () {
              context.push(RouteName.helpSupport);
            },
          ),
          const Gap(20),
          const LogoutButton(),
          const Gap(20),
        ],
      ),
    );
  }

  GestureDetector profileTile(
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
}
