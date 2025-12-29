import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';

class UserProfileInfoSection extends StatelessWidget {
  const UserProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            AppImages.imagesUserProfileImage,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "محمد احمد",
                  style: AppFontStyle.bold24Black1A(context),
                ),
              ),
              const Gap(4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.iconsUserProfilePhone,
                      fit: BoxFit.cover,
                    ),
                    const Gap(4),
                    Text(
                      "+964 770 123 4567",
                      style: AppFontStyle.regular14black4B(context),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
