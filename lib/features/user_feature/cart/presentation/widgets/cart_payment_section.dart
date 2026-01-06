import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartPaymentSection extends StatefulWidget {
  const CartPaymentSection({super.key});

  @override
  State<CartPaymentSection> createState() => _CartPaymentSectionState();
}

class _CartPaymentSectionState extends State<CartPaymentSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.iconsPaymentMethodIcon),
              const Gap(8),
              Text(
                "user.payment_method".tr(),
                style: AppFontStyle.bold14black1A(context),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              paymentTile(
                title: "user.cash".tr(),
                isSelected: selectedIndex == 0,
                iconPath: AppIcons.iconsPaymentCashActiveIcon,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              const Gap(12),
              paymentTile(
                title: "user.credit".tr(),
                isSelected: selectedIndex == 1,
                iconPath: AppIcons.iconsPaymentCreditInactiveIcon,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget paymentTile({
    required String title,
    required bool isSelected,
    required String iconPath,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : null,
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 1)
              : null,
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.whiteF5,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: isSelected
                      ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.black1A,
                          BlendMode.srcIn,
                        ),
                ),
              ),
            ),
            const Gap(8),
            Text(
              title,
              style: isSelected
                  ? AppFontStyle.semibold14Primary(context)
                  : AppFontStyle.semibold14black4B(context),
            ),
            if (isSelected) ...[
              const Spacer(),
              SvgPicture.asset(AppIcons.iconsCartPaymentCheck),
            ],
          ],
        ),
      ),
    );
  }
}
