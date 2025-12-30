import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserCouponsView extends StatelessWidget {
  const UserCouponsView({super.key});

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "خصم 20% على مطاعم محددة",
                        style: AppFontStyle.regular14black4B(context),
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "FREE20",

                                    style: AppFontStyle.bold14Primary(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(12),
                            CustomButton(
                              width: 120,
                              onTap: () {},
                              prefixIcon: SvgPicture.asset(
                                AppIcons.iconsCopy24Orange,
                              ),
                              title: "user.copy".tr(),
                              textStyle: AppFontStyle.medium16Primary(context),
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
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
              Text(
                "user.coupons".tr(),
                style: AppFontStyle.bold16Black1A(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
