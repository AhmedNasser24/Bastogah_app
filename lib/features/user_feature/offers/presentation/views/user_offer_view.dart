import 'package:bastogah_app/core/widgets/custom_search_field.dart';
import 'package:bastogah_app/features/user_feature/offers/presentation/widgets/user_offer_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../user_layout/presentation/widgets/user_app_bar.dart';

class UserOffersView extends StatelessWidget {
  const UserOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAppBar(address: "بغداد,العراق"),
        const CustomSearchField(),
        const Gap(12),
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
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
}
