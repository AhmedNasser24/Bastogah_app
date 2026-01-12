import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../home/data/model/user_merchant_model.dart';
import 'favourite_item_image.dart';
import '../../../../../core/widgets/favourite_icon_button.dart';

class UserMerchantItem extends StatelessWidget {
  const UserMerchantItem({super.key, this.merchant});
  final UserMerchantModel? merchant;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          color: AppColors.white,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: FavouriteItemImage(image: merchant?.image),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      Expanded(
                        child: Text(
                          merchant?.displayName ?? "بيتزا هت",
                          style: AppFontStyle.medium16black1A(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      SvgPicture.asset(AppIcons.iconsStar),
                      Text(
                        "4.5",
                        style: AppFontStyle.regular14black1A(context),
                      ),
                      Text("(256)", style: AppFontStyle.regular12grey(context)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.iconsUserFavouriteFreeDeliveryIcon,
                      ),
                      const Gap(4),
                      Expanded(
                        child: Text(
                          "توصيل مجاني",
                          style: AppFontStyle.medium14green(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      CustomButton(
                        width: 120,
                        onTap: () {
                          context.push(RouteName.userProducts, extra: merchant);
                        },
                        title: "user.order_now".tr(),
                        textStyle: AppFontStyle.semibold14Primary(context),
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: FavouriteIconButton(
            activeIcon: SvgPicture.asset(AppIcons.iconsFavourite24White),
            inactiveIcon: SvgPicture.asset(AppIcons.iconsNotFavourite24White),
            backgroundColor: Colors.transparent,
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment(1.19, 1.19),
                end: Alignment(0.00, 0.00),
                colors: [
                  Colors.white,
                  Color(0xFFFFBF7F),
                  Color(0xFFFF9F3F),
                  Color(0xFFFF8F1F),
                  Color(0xFFFF870F),
                  Color(0xFFFF7F00),
                ],
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.iconsStar12White),
                const Gap(4),
                Text("مميز", style: AppFontStyle.regular12White(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
