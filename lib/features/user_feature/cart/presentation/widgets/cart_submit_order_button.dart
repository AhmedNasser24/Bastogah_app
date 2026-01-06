import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_button.dart';

class CartSubmitOrderButton extends StatelessWidget {
  const CartSubmitOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      prefixIcon: SvgPicture.asset(AppIcons.iconsCartDollarIcon),
      title: "user.submit_order".tr(),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
      ),
    );
  }
}
