import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/notification_icon_button.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key, required this.title});
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
            SvgPicture.asset(AppIcons.iconsUserCart, height: 20, width: 20),
            const Gap(6),
            NotificationIconButton(
              isThereNewNotification: true,
              onTap: () {
                context.push(RouteName.notification);
              },
            ),
          ],
        ),
      ),
    );
  }
}
