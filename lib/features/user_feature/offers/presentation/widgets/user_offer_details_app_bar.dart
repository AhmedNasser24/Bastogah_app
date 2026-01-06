import 'package:bastogah_app/core/widgets/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserOfferDetailsAppBar extends StatelessWidget {
  const UserOfferDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 170,
      backgroundColor: AppColors.white,
      pinned: true,
      toolbarHeight: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackArrowButton(),
          FavouriteIconButton(
            activeIcon: SvgPicture.asset(AppIcons.iconsActiveUserFavourite),
            inactiveIcon: SvgPicture.asset(AppIcons.iconsInactiveUserFavourite),
            backgroundColor: AppColors.secondary,
          ),
        ],
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // final isCollapsed = constraints.maxHeight <= kToolbarHeight + 40;
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsetsDirectional.only(
              bottom: 30,
              start: 60,
            ),
            // title: isCollapsed
            //     ? Text(
            //         'الركن السوري',
            //         style: AppFontStyle.medium16black1A(context),
            //       )
            //     : null,
            background: Stack(
              fit: StackFit.loose,
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5TcyKQ9vyk4-GTxk_nVGqsXZc1EEImmONvw&s',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // bottom: 0,
                  child: Container(
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
