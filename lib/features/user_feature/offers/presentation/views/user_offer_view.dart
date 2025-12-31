import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/user_feature/offers/presentation/widgets/user_offer_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/cart_icon_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/notification_icon_button.dart';

class UserOffersView extends StatelessWidget {
  const UserOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context, address: "بغداد,العراق"),
        const CustomSearchField(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverGap(16),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: CustomButton(
                          prefixIcon: SvgPicture.asset(
                            AppIcons.iconsOfferIcon16White,
                          ),
                          title: "user.special_offers".tr(),
                          textStyle: AppFontStyle.semibold14White(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverGap(16),
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: 600,
                  mainAxisExtent: 270,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const UserOfferItem();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget appBar(BuildContext context, {required String address}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.iconsPin24Icon),
            const Gap(10),
            Text(
              address,
              style: AppFontStyle.semibold12black1A(context),
              overflow: TextOverflow.fade,
            ),
            const Spacer(),
            const CartIconButton(),
            const Gap(8),
            const NotificationIconButton(isThereNewNotification: true),
          ],
        ),
      ),
    );
  }
}
