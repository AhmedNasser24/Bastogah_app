import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DriverProfileInfoSection extends StatelessWidget {
  const DriverProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(AppImages.imagesDriverPhote),
        ),
        Text("محمد علي", style: AppFontStyle.bold20Black1A(context)),
        Text(
          "+966 123 456 789",
          style: AppFontStyle.regular14black4B(context),
          textDirection: TextDirection.ltr,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            noOfDrivens(context, noOfDrivens: 342),
            Container(height: 40, width: 1, color: AppColors.grey),
            rating(context, rating: 4.5),
          ],
        ),
        const Gap(0),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              infoTile(
                context,
                title: "driver.location".tr(),
                subtitle: "البصرة",
                iconPath: AppIcons.iconsPin16Icon,
              ),
              infoTile(
                context,
                title: "driver.member_since".tr(),
                subtitle: "يناير 2024",
                iconPath: AppIcons.iconsPersonIcon,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox infoTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String iconPath,
  }) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.secondary,
            radius: 20,
            child: Center(child: SvgPicture.asset(iconPath)),
          ),
          const Gap(8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFontStyle.regular12grey(context)),
                const Gap(4),
                Text(subtitle, style: AppFontStyle.semibold14black4B(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget noOfDrivens(BuildContext context, {required int noOfDrivens}) {
    return Column(
      children: [
        Text(
          noOfDrivens.toString(),
          style: AppFontStyle.bold18Black1A(context),
        ),
        Text(
          "merchant.profile.drivens".tr(),
          style: AppFontStyle.regular12grey(context),
        ),
      ],
    );
  }

  Widget rating(BuildContext context, {required double rating}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.iconsStar),
            const Gap(4),
            Text(rating.toString(), style: AppFontStyle.bold18Black1A(context)),
          ],
        ),
        Text(
          "merchant.profile.ratings".tr(),
          style: AppFontStyle.regular12grey(context),
        ),
      ],
    );
  }
}
