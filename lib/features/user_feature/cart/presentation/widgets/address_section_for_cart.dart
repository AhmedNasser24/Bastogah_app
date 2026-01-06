import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_button.dart';

class AddressSectionForCart extends StatelessWidget {
  const AddressSectionForCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAddress(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.secondary,
              child: SvgPicture.asset(AppIcons.iconsPin24Icon),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user.delivery_address".tr(),
                    style: AppFontStyle.bold14black1A(context),
                  ),
                  Text(
                    "بغداد، المنصور، شارع الرئيسي",
                    style: AppFontStyle.regular12grey(context),
                  ),
                ],
              ),
            ),
            const Gap(4),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
          ],
        ),
      ),
    );
  }

  void showAddress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 18,
          children: [
            Row(
              children: [
                Text(
                  "user.select_delivery_address".tr(),
                  style: AppFontStyle.bold14black1A(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: AppColors.black1A),
                ),
              ],
            ),
            addressTile(
              context,
              title: "المنزل",
              subTitle: "بغداد، المنصور، شارع الرئيسي",
              isSelected: true,
            ),
            addressTile(
              context,
              title: "العمل",
              subTitle: "بغداد، الكرادة، شارع الزهور",
            ),
            CustomButton(
              onTap: () {
                context.push(RouteName.userAddNewAddress);
              },
              prefixIcon: const Icon(Icons.add, color: AppColors.primary),
              title: "user.add_new_address".tr(),
              color: Colors.transparent,
              textStyle: AppFontStyle.medium16Primary(context),
              borderColor: AppColors.primary,
              borderWidth: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget addressTile(
    BuildContext context, {
    required String title,
    required String subTitle,
    bool isSelected = false,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.secondary,
          child: SvgPicture.asset(AppIcons.iconsPin24Icon),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppFontStyle.bold14black1A(context)),
              Text(subTitle * 2, style: AppFontStyle.regular12grey(context)),
            ],
          ),
        ),
        const Gap(4),
        isSelected
            ? SvgPicture.asset(AppIcons.iconsCartAddressCheck)
            : const SizedBox.shrink(),
      ],
    );
  }
}
