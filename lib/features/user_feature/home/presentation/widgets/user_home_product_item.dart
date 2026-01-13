import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/favourite_icon_button.dart';

class UserHomeProductItem extends StatelessWidget {
  const UserHomeProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppImages.imagesPizzaHut,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(
                //   left: 4,
                //   top: 4,
                //   child: FavouriteIconButton(
                //     activeIcon: SvgPicture.asset(
                //       AppIcons.iconsFavourite24White,
                //     ),
                //     inactiveIcon: SvgPicture.asset(
                //       AppIcons.iconsNotFavourite24White,
                //     ),
                //     backgroundColor: Colors.transparent,
                //   ),
                // ),
              ],
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "بيتزا هت",
                          style: AppFontStyle.medium16black1A(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "اعلي تقييم",
                          style: AppFontStyle.regular12Primary(context),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "مشاوي عراقية",
                    style: AppFontStyle.regular12grey(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset(AppIcons.iconsStar),
                      Text(
                        "4.5",
                        style: AppFontStyle.regular14black1A(context),
                      ),
                      Text("(256)", style: AppFontStyle.regular12grey(context)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
