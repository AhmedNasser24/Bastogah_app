import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class MerchantProfileInfoSection extends StatelessWidget {
  const MerchantProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        const CircleAvatar(
          radius: 51.5,
          backgroundColor: AppColors.lightGrey,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.imagesResturantLogo),
          ),
        ),
        Text("شاورما كورنر", style: AppFontStyle.bold20Black1A(context)),
        Text(
          "+966 123 456 789",
          style: AppFontStyle.regular14black4B(context),
          textDirection: TextDirection.ltr,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            noOfOrders(context, noOfOrders: 342),
            Container(height: 40, width: 1, color: AppColors.grey),
            rating(context, rating: 4.5),
          ],
        ),
      ],
    );
  }

  Widget noOfOrders(BuildContext context, {required int noOfOrders}) {
    return Column(
      children: [
        Text(noOfOrders.toString(), style: AppFontStyle.bold18Black1A(context)),
        Text(
          "merchant.profile.orders".tr(),
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
