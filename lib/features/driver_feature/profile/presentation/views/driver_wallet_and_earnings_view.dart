import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class DriverWalletAndEarningsView extends StatelessWidget {
  const DriverWalletAndEarningsView({super.key});

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
                      walletTile(
                        context,
                        title: "أرباح توصيل #51464598",
                        amount: "450",
                        time: "اليوم - 02:30 م",
                      ),
                      walletTile(
                        context,
                        title: "أرباح توصيل #51464598",
                        amount: "+450",
                        time: "اليوم - 02:30 م",
                      ),
                      walletTile(
                        context,
                        title: "أرباح توصيل #51464598",
                        amount: "+450",
                        time: "اليوم - 02:30 م",
                      ),
                      walletTile(
                        context,
                        title: "أرباح توصيل #51464598",
                        amount: "+450",
                        time: "اليوم - 02:30 م",
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

  Widget walletTile(
    BuildContext context, {
    required String title,
    required String amount,
    required String time,
  }) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.lightGreen,
              child: SvgPicture.asset(AppIcons.iconsGreenWallet),
            ),
            const Gap(10),
            Expanded(
              child: Text(
                title,
                style: AppFontStyle.semibold14black1A(context),
              ),
            ),
            const Gap(6),
            Column(
              children: [
                Text(
                  "+$amount",
                  style: AppFontStyle.bold18Green(context),
                  textDirection: TextDirection.ltr,
                ),
                const Gap(4),
                Text(time, style: AppFontStyle.regular12grey(context)),
              ],
            ),
          ],
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
              "driver.dues".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
          ],
        ),
      ),
    );
  }
}
