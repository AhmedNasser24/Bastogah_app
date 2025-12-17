import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../widgets/order_details_widgets/order_details_app_bar.dart';
import '../widgets/order_details_widgets/show_location_map_image.dart';

class MerchantOrderDetailsView extends StatelessWidget {
  const MerchantOrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              OrderDetailsAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      CustomerDetailsSection(),
                      DriverDetailsSection(),
                      OrderPriceDetailsSection(),
                      Gap(20),
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
          price: "15000",
        ),
        const Gap(12),
        customPrice(
          context,
          title: "merchant.discount".tr(),
          price: "-5000",
          color: AppColors.red,
        ),
        const Gap(12),
        customPrice(context, title: "merchant.service".tr(), price: "1200"),
        const Gap(12),
        customPrice(context, title: "merchant.delivery".tr(), price: "5000"),
        const Gap(20),
        Row(
          children: [
            Text(
              "merchant.total_price".tr(),
              style: AppFontStyle.semibold16Primary(context),
            ),
            const Spacer(),
            Text(
              "merchant.currency".tr(args: ["16200"]),
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

class DriverDetailsSection extends StatelessWidget {
  const DriverDetailsSection({super.key});
  final String? driverName = "احمد علي";
  final String? driverImage = AppImages.imagesCircleAvatarImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.driver".tr(),
          style: AppFontStyle.bold18Black4B(context),
        ),
        const Gap(20),
        Row(
          children: [
            driverName != null
                ? const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      AppImages.imagesCircleAvatarImage,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    radius: 24,
                    child: Center(
                      child: SvgPicture.asset(AppIcons.iconsPerson24Icon),
                    ),
                  ),
            const Gap(8),
            Expanded(
              child: Text(
                driverName ?? "merchant.not_assigned_yet".tr(),
                style: AppFontStyle.regular16black4B(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomerDetailsSection extends StatelessWidget {
  const CustomerDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.customer".tr(),
          style: AppFontStyle.bold18Black4B(context),
        ),
        const Gap(20),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsPerson24Icon,
          title: "merchant.order_details.customer_name".tr(),
          subtitle: "خالد علي",
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsHome24Icon,
          title: "merchant.order_details.address".tr(),
          subtitle: "شارع واحد - الحي الأول - بغداد",
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsPhone24Icon,
          title: "merchant.order_details.phone".tr(),
          subtitle: "07701234567",
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsPin24Icon,
          title: "merchant.order_details.location".tr(),
        ),
        const Gap(8),
        const ShowLocationMapImage(),
      ],
    );
  }

  Widget customCustomerDetails(
    BuildContext context, {
    required String icon,
    required String title,
    String? subtitle,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.secondary,
          radius: 24,
          child: Center(child: SvgPicture.asset(icon)),
        ),
        const Gap(8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppFontStyle.regular14grey(context)),
              if (subtitle != null) ...[
                const Gap(4),
                Text(subtitle, style: AppFontStyle.regular16black4B(context)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
