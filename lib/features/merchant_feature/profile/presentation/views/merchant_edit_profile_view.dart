import 'package:bastogah_app/features/merchant_feature/profile/presentation/widgets/cancel_edit_profile_button.dart';
import 'package:bastogah_app/features/merchant_feature/profile/presentation/widgets/save_edit_profile_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/back_arrow_button.dart';
import '../widgets/merchant_profile_name_field.dart';
import '../widgets/merchant_profile_phone_field.dart';
import '../widgets/merchant_profile_store_kind_field.dart';

class MerchantEditProfileView extends StatelessWidget {
  const MerchantEditProfileView({super.key});

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
                    spacing: 12,
                    children: [
                      const Gap(10),
                      logoImage(),
                      Text(
                        "merchant.profile.press_to_change_photo".tr(),
                        style: AppFontStyle.regular14black4B(context),
                      ),
                      const Gap(0),
                      const MerchantProfileNameField(),
                      const MerchantProfilePhoneField(),
                      const MerchantProfileStoreKindField(),
                      const SaveEditProfileButton(),
                      const CancelEditProfileButton(),
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

  Widget logoImage() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        const CircleAvatar(
          radius: 51.5,
          backgroundColor: AppColors.lightGrey,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.imagesResturantLogo),
          ),
        ),
        SvgPicture.asset(AppIcons.iconsCameraProfileIcon),
      ],
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
              "merchant.profile.profile_info".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
