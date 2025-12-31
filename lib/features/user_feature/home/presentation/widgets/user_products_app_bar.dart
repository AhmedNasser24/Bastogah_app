import 'package:bastogah_app/core/widgets/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserProductsAppBar extends StatelessWidget {
  const UserProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      expandedHeight: 170,
      pinned: true,
      toolbarHeight: 80,
      flexibleSpace: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: Image.asset(AppImages.imagesPizzaHut, fit: BoxFit.cover),
          ),
          Container(
            height: 20,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          ),
          const Positioned(right: 16, top: 12, child: BackArrowButton()),
          Positioned(
            left: 16,
            top: 12,
            child: FavouriteIconButton(
              activeIcon: SvgPicture.asset(AppIcons.iconsActiveUserFavourite),
              inactiveIcon: SvgPicture.asset(
                AppIcons.iconsInactiveUserFavourite,
              ),
              backgroundColor: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
