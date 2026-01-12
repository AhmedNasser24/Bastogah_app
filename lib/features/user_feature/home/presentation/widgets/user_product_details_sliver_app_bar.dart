import 'package:bastogah_app/core/widgets/custom_cached_image.dart';
import 'package:bastogah_app/core/widgets/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserProductDetailsSliverAppBar extends StatelessWidget {
  const UserProductDetailsSliverAppBar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      expandedHeight: 170,
      pinned: true,
      toolbarHeight: 60,
      flexibleSpace: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: CustomCachedImage(imagePath: image),
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
