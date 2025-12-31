import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/widgets/notification_icon_button.dart';

class DriverAppBar extends StatelessWidget {
  const DriverAppBar({super.key, required this.title});
  final String title;
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
              title,
              style: AppFontStyle.bold16Black1A(context),
              overflow: TextOverflow.fade,
            ),
            const Spacer(),
            const NotificationIconButton(isThereNewNotification: true),
          ],
        ),
      ),
    );
  }
}
