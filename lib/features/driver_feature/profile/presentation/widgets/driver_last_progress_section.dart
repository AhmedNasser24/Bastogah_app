import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';

class DriverLastProgressSection extends StatelessWidget {
  const DriverLastProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return walletTile(
          context,
          title: "أرباح توصيل #51464598",
          amount: "450",
          time: "اليوم - 02:30 م",
        );
      },
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
}
