import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../widgets/user_products_app_bar.dart';
import '../widgets/user_products_filter.dart';
import '../widgets/user_products_item.dart';

class UserProductsView extends StatelessWidget {
  const UserProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const UserProductsAppBar(),
            const SliverToBoxAdapter(child: ResturantInfoSection()),
            const SliverGap(16),
            const SliverToBoxAdapter(child: UserProductFilter()),
            const SliverGap(16),

            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 700,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 90,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: UserProductItem(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResturantInfoSection extends StatelessWidget {
  const ResturantInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // need this row for making box constraint work
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Center(
            child: GestureDetector(
              onTap: () => context.push(RouteName.userStoreRating),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    resturantLogo(),
                    const Gap(8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "مطعم بيتزا هت",
                                  style: AppFontStyle.bold18Black1A(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Gap(8),
                              SvgPicture.asset(AppIcons.iconsInfo28BlackIcon),
                            ],
                          ),
                          Text(
                            "شاورما - طعام سريع",
                            style: AppFontStyle.medium14black4B(context),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          resturantRating(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container resturantLogo() {
    return Container(
      width: 65,
      height: 65,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.5),
        child: Image.asset(AppImages.imagesResturantLogo, fit: BoxFit.cover),
      ),
    );
  }

  Widget resturantRating(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, 0.00),
          end: Alignment(1.00, 1.00),
          colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.iconsStar12White),
          const Gap(4),
          Text("4.8", style: AppFontStyle.bold14White(context)),
        ],
      ),
    );
  }
}
