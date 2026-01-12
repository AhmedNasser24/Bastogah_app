import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../widgets/customer_review_item.dart';
import '../widgets/user_products_app_bar.dart';

class UserStoreRatingView extends StatelessWidget {
  const UserStoreRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const UserProductsAppBar(image: ""),

            const SliverToBoxAdapter(child: ResturantInfoSection()),
            const SliverGap(16),
            const SliverToBoxAdapter(child: ResturantRatingSection()),
            const SliverGap(16),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "user.customer_reviews".tr(),
                      style: AppFontStyle.bold18Black1A(context),
                    ),
                    const Spacer(),
                    CustomButton(
                      onTap: () {
                        context.push(RouteName.writeYourReview);
                      },
                      title: "user.write_your_review".tr(),
                      width: 120,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      textStyle: AppFontStyle.bold14White(context),
                    ),
                  ],
                ),
              ),
            ),
            const SliverGap(16),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: CustomerReviewItem(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResturantRatingSection extends StatelessWidget {
  const ResturantRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              constraints: const BoxConstraints(maxWidth: 600),
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Text(
                                "4.8",
                                style: AppFontStyle.bold48White(context),
                              ),
                              Text(
                                " من 5",
                                style: AppFontStyle.medium18White(context),
                              ),
                            ],
                          ),
                        ),
                        // const Gap(4),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: SvgPicture.asset(
                                  AppIcons.iconsStar12White,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Text(
                          "بناءً على 450+ تقييم",
                          style: AppFontStyle.medium18White(context),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppIcons.iconsTopRating,
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
                            resturantRating(context),
                          ],
                        ),
                        Text(
                          "شاورما - طعام سريع",
                          style: AppFontStyle.medium14black4B(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
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
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, 0.00),
              end: Alignment(1.00, 1.00),
              colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.iconsStar12White),
              const Gap(4),
              Text("4.8", style: AppFontStyle.bold14White(context)),
            ],
          ),
        ),
      ],
    );
  }
}
