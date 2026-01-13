import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../routing/route_name.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({
    super.key,
    required this.isThereNewNotification,
  });
  final bool isThereNewNotification;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteName.notification);
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(shape: BoxShape.circle),
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
