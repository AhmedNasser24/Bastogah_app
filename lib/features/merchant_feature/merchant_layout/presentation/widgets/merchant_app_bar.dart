import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import 'notification_icon_button.dart';

class MerchantAppBar extends StatelessWidget {
  const MerchantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(AppImages.imagesLogoOrange),
            const Gap(10),
            Text(
              "merchant.hello".tr(),
              style: AppFontStyle.bold16Black1A(context),
            ),
            const Spacer(),
            const NotificationIconButton(),
          ],
        ),
      ),
    );
  }
}
