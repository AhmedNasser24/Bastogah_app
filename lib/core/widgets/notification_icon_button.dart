import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({
    super.key,
    required this.isThereNewNotification,
    required this.onTap,
  });
  final bool isThereNewNotification;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(AppIcons.iconsNotificationIcon),
            if (isThereNewNotification) ...[
              const Positioned(
                right: -2,
                top: -4,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
