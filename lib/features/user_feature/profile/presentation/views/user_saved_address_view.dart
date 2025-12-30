import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserSavedAddressView extends StatelessWidget {
  const UserSavedAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Card(
                    color: AppColors.white,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.secondary,
                                child: SvgPicture.asset(
                                  AppIcons.iconsPin16Icon,
                                ),
                              ),
                              const Gap(8),
                              Text(
                                "المنزل",
                                style: AppFontStyle.regular16black1A(context),
                              ),
                            ],
                          ),
                          Text(
                            "85 شارع  الساحات,حتا",
                            style: AppFontStyle.regular14black4B(context),
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  prefixIcon: SvgPicture.asset(
                                    AppIcons.iconsUserSavedAddressEditIcon,
                                  ),
                                  title: "edit".tr(),
                                  textStyle: AppFontStyle.medium16black1A(
                                    context,
                                  ),
                                  borderColor: AppColors.black4B,
                                  color: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                child: CustomButton(
                                  prefixIcon: SvgPicture.asset(
                                    AppIcons.iconsUserSavedAddressDeleteIcon,
                                  ),
                                  title: "delete".tr(),
                                  textStyle: AppFontStyle.medium16Red(context),
                                  borderColor: AppColors.red,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 60,
        child: Center(
          child: Row(
            children: [
              const BackArrowButton(),
              const Gap(8),
              Expanded(
                child: Text(
                  "user.saved_addresses".tr(),
                  style: AppFontStyle.bold16Black1A(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: CustomButton(
                  onTap: () {},
                  title: "user.add".tr(),
                  width: 80,
                  textStyle: AppFontStyle.medium16White(context),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
