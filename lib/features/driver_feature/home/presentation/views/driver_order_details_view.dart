import 'package:bastogah_app/core/enums/driver_filter_enum.dart';
import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/order_date_and_time_section.dart';
import '../widgets/order_details_widgets/driver_accept_order.dart';
import '../widgets/order_details_widgets/driver_order_details_app_bar.dart';
import '../widgets/order_details_widgets/driver_refused_order_button.dart';

class DriverOrderDetailsView extends StatelessWidget {
  const DriverOrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    DriverFilterEnum driverFilterStatus = DriverFilterEnum.inDelivery;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              DriverOrderDetailsAppBar(
                orderId: "65488465416 # ",
                status: driverFilterStatus.status,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      const OrderDateAndTimeSection(),
                      const OrderPriceDetailsSection(),
                      const StoreSection(),
                      const OrderItemsSection(),
                      const Gap(20),
                      switch (driverFilterStatus) {
                        DriverFilterEnum.pending =>
                          const DriverAcceptOrderButton(),
                        DriverFilterEnum.inDelivery =>
                          const DriverRefusedOrderButton(),
                        (_) => const SizedBox.shrink(),
                      },

                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text("store".tr(), style: AppFontStyle.bold18Black4B(context)),
        Row(
          children: [
            const CircleAvatar(
              radius: 22.5,
              backgroundImage: AssetImage(AppImages.imagesResturantLogo),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مطعم بيتزا هت",
                    style: AppFontStyle.semibold14black1A(context),
                  ),
                  const Gap(4),
                  Text(
                    "+966533925658",
                    style: AppFontStyle.semibold12grey(context),
                  ),
                ],
              ),
            ),
            const Gap(8),
            SvgPicture.asset(AppIcons.iconsDriverOrderDetailsGreenPhone),
          ],
        ),
      ],
    );
  }
}

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          "merchant.products".tr(),
          style: AppFontStyle.bold18Black4B(context),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 700,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            mainAxisExtent: 70,
          ),
          itemCount: 5,
          itemBuilder: (context, index) => orderItem(context),
        ),
      ],
    );
  }

  SizedBox orderItem(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(AppImages.imagesPizzaImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "بيتزا لحم",
                  style: AppFontStyle.semibold14black1A(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "عجينة البيتزا, صلصة البيتزا, شاورما لحم, جبنة الموزريلا, فلفل, زيتون",
                  style: AppFontStyle.semibold12grey(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      "merchant.quantity".tr(),
                      style: AppFontStyle.semibold12grey(context),
                    ),
                    const Gap(4),
                    Text("2", style: AppFontStyle.semibold12black4B(context)),
                    const Spacer(),
                    Text(
                      "merchant.currency".tr(args: ["16000"]),
                      style: AppFontStyle.bold14Primary(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPriceDetailsSection extends StatelessWidget {
  const OrderPriceDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("merchant.price".tr(), style: AppFontStyle.bold18Black4B(context)),
        const Gap(20),
        customPrice(
          context,
          title: "merchant.orders_price".tr(),
          price: "5000",
        ),
        const Gap(12),
        customPrice(
          context,
          title: "merchant.discount".tr(),
          price: "4000",
          color: AppColors.red,
        ),
        const Gap(12),
        customPrice(context, title: "merchant.service".tr(), price: "6000"),
        const Gap(12),
        customPrice(context, title: "merchant.delivery".tr(), price: "7000"),
        const Gap(20),
        Row(
          children: [
            Text(
              "merchant.total_price".tr(),
              style: AppFontStyle.semibold16Primary(context),
            ),
            const Spacer(),
            Text(
              "merchant.currency".tr(args: ["8000"]),
              style: AppFontStyle.semibold16Primary(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget customPrice(
    BuildContext context, {
    required String title,
    required String price,
    Color? color,
  }) {
    return Row(
      children: [
        Text(title, style: AppFontStyle.regular14black4B(context)),
        const Spacer(),
        Text(
          "merchant.currency".tr(args: [price]),
          style: AppFontStyle.regular16black4B(context).copyWith(color: color),
        ),
      ],
    );
  }
}
