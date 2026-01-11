import 'package:bastogah_app/core/widgets/favourite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/back_arrow_button.dart';

class UserOfferDetailsAppBar extends StatelessWidget {
  const UserOfferDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      expandedHeight: 240,
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 0,
      elevation: 0,
      pinned: true,
      centerTitle: true,
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
          final isCollapsed =
              constraints.maxHeight <=
              kToolbarHeight + MediaQuery.of(context).padding.top + 20;
          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 16),
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isCollapsed ? 1.0 : 0.0,
              child: Text(
                'الركن السوري',
                style: AppFontStyle.bold18Black1A(context),
              ),
            ),
            background: Stack(
              fit: StackFit.loose,
              children: [
                Positioned.fill(
                  child: Image.asset(AppImages.imagesBurger, fit: BoxFit.cover),
                ),
                // Positioned.fill(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Colors.black.withOpacity(0.2),
                //           Colors.transparent,
                //         ],
                //         stops: const [0.0, 0.4],
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
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
