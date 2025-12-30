import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';

class UserFavouriteAppBar extends StatelessWidget {
  const UserFavouriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.iconsActiveUserFavourite),
            const Gap(8),
            Text(
              'user.favourite'.tr(),
              style: AppFontStyle.semibold20Primary(context),
            ),
          ],
        ),
      ),
    );
  }
}
