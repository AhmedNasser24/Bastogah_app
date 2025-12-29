import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_button.dart';

class MyOrderBuyAgainButton extends StatelessWidget {
  const MyOrderBuyAgainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      width: 150,
      title: "user.buy_again".tr(),
      textStyle: AppFontStyle.semibold14Primary(context),
      color: Colors.transparent,
      prefixIcon: SvgPicture.asset(AppIcons.iconsUserMyOrderRepeat),
      borderColor: AppColors.secondary,
      onTap: () {},
    );
  }
}
