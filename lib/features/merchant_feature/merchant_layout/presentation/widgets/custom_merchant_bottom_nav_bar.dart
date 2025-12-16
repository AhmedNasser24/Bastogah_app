import 'package:bastogah_app/core/models/merchant_bottom_bar_model.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';

class CustomMerchantBottomNavBar extends StatefulWidget {
  const CustomMerchantBottomNavBar({super.key});

  @override
  State<CustomMerchantBottomNavBar> createState() =>
      _CustomMerchantBottomNavBarState();
}

class _CustomMerchantBottomNavBarState
    extends State<CustomMerchantBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          for (int i = 0; i < merchantBottomBarItems.length; i++)
            Expanded(
              child: InkWell(
                onTap: () {
                  context.go(merchantBottomBarItems[i].routeName);
                  setState(() {
                    _currentIndex = i;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: i == _currentIndex
                        ? AppColors.yellow
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        i == _currentIndex
                            ? SvgPicture.asset(
                                merchantBottomBarItems[i].activeIcon,
                              )
                            : SvgPicture.asset(
                                merchantBottomBarItems[i].inactiveIcon,
                              ),
                        const Gap(4),
                        Text(
                          merchantBottomBarItems[i].title.tr(),
                          style: AppFontStyle.medium10primary(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
