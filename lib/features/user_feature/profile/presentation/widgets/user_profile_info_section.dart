import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../data/model/profile_model.dart';

class UserProfileInfoSection extends StatelessWidget {
  const UserProfileInfoSection({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CustomCachedImage(
            imagePath: profileModel.image ?? "",
            errorWidget: Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Icon(Icons.person_outline_outlined, size: 50),
              ),
            ),
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
                  profileModel.displayName ?? "--",
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
                      profileModel.phone ?? "--",
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
