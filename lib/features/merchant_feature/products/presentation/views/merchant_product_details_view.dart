import 'package:bastogah_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/merchant_product_details_app_bar.dart';
import '../widgets/merchant_product_image.dart';

class MerchantProductDetailsView extends StatelessWidget {
  const MerchantProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MerchantProductDetailsAppBar(),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: MerchantProductImage()),
                      TopRateTextWidget(),
                      ProductDetailsSection(),
                      MoreOptionsSection(),
                      RemovedGradientSection(),
                      MostPopularSection(),
                      Gap(20),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                title: "merchant.edit".tr(),
                prefixIcon: AppIcons.iconsEditIcon,
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class TopRateTextWidget extends StatelessWidget {
  const TopRateTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.iconsStar),
              const Gap(4),
              Text(
                "merchant.top_rated".tr(),
                style: AppFontStyle.regular14Primary(context),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("بيتزا لحم", style: AppFontStyle.semibold18black1A(context)),
        Text(
          "عجينة البيتزا, صلصة البيتزا, شاورما لحم, جبنة الموزريلا, فلفل, زيتون",
          style: AppFontStyle.medium16Grey(context),
        ),
        Text(
          "merchant.currency".tr(args: ["5000"]),
          textDirection: TextDirection.rtl,
          style: AppFontStyle.semibold18black1A(context),
        ),
      ],
    );
  }
}

class MoreOptionsSection extends StatelessWidget {
  const MoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "merchant.more_options".tr(),
          style: AppFontStyle.semibold18black1A(context),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                const CustomCheckBox(),
                const Gap(8),
                Text("صلصة", style: AppFontStyle.regular14black4B(context)),
                Text(
                  " +${"merchant.currency".tr(args: ["500"])}",
                  style: AppFontStyle.regular14grey(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RemovedGradientSection extends StatelessWidget {
  const RemovedGradientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "merchant.remove_ingredients".tr(),
          style: AppFontStyle.semibold18black1A(context),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                const CustomCheckBox(),
                const Gap(8),
                Text("مشروم", style: AppFontStyle.regular14black4B(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          "merchant.most_popular".tr(),
          style: AppFontStyle.semibold18black1A(context),
        ),
        Row(
          children: [
            const CustomCheckBox(),
            const Gap(8),
            Text("مشروم", style: AppFontStyle.regular14black4B(context)),
          ],
        ),
      ],
    );
  }
}
