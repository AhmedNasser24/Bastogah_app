import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

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
                    children: [
                      const Gap(20),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.iconsHelpPhone),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "merchant.profile.call_directly".tr(),
                                  style: AppFontStyle.regular16black1A(context),
                                ),
                                const Gap(12),
                                Text(
                                  "+966 1234 5678",
                                  style: AppFontStyle.regular12black4B(context),
                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            width: 100,
                            title: "merchant.profile.call_now".tr(),
                            textStyle: AppFontStyle.regular12black4B(context),
                            color: AppColors.white,
                            borderColor: AppColors.lightGrey,
                          ),
                        ],
                      ),
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

  Widget appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Row(
          children: [
            const BackArrowButton(),
            const Gap(8),
            Text(
              "merchant.profile.help_support".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
