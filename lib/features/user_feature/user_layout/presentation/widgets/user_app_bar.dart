import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/cart_icon_button.dart';
import '../../../../../core/widgets/notification_icon_button.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.iconsPin24Icon),
            const Gap(10),
            Text(
              address,
              style: AppFontStyle.semibold12black1A(context),
              overflow: TextOverflow.fade,
            ),
            const Spacer(),
            const CartIconButton(),
            const Gap(8),
            const NotificationIconButton(isThereNewNotification: true),
          ],
        ),
      ),
    );
  }
}
