import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/merchant_feature/home/data/models/order_item_model/item.dart';
import 'package:bastogah_app/features/merchant_feature/home/data/models/order_item_model/order_item_model.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../widgets/order_details_widgets/order_details_app_bar.dart';
import '../widgets/order_details_widgets/show_location_map_image.dart';

class MerchantOrderDetailsView extends StatelessWidget {
  const MerchantOrderDetailsView({super.key, required this.order});
  final MerchantOrderItemModel order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const OrderDetailsAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      CustomerDetailsSection(order: order),
                      DriverDetailsSection(driverName: order.driverName),
                      OrderPriceDetailsSection(order: order),
                      OrderItemsSection(order: order),
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

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key, required this.order});

  final MerchantOrderItemModel order;
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
          itemCount: order.items?.length ?? 0,
          itemBuilder: (context, index) =>
              orderItem(context, order.items![index]),
        ),
      ],
    );
  }

  SizedBox orderItem(BuildContext context, Item item) {
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
                  item.productName ?? "--",
                  style: AppFontStyle.semibold14black1A(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.notes ?? "",
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
                    Text(
                      item.qty.toString(),
                      style: AppFontStyle.semibold12black4B(context),
                    ),
                    const Spacer(),
                    Text(
                      "merchant.currency".tr(args: [item.price.toString()]),
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
  const OrderPriceDetailsSection({super.key, required this.order});
  final MerchantOrderItemModel order;
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
          price: order.itemsPrice?.toString() ?? "0",
        ),
        const Gap(12),
        customPrice(
          context,
          title: "merchant.discount".tr(),
          price: order.totalDiscount?.toString() ?? "0",
          color: AppColors.red,
        ),
        const Gap(12),
        customPrice(context, title: "merchant.service".tr(), price: "--"),
        const Gap(12),
        customPrice(
          context,
          title: "merchant.delivery".tr(),
          price: order.shippingPrice?.toString() ?? "0",
        ),
        const Gap(20),
        Row(
          children: [
            Text(
              "merchant.total_price".tr(),
              style: AppFontStyle.semibold16Primary(context),
            ),
            const Spacer(),
            Text(
              "merchant.currency".tr(
                args: [order.clientPrice?.toString() ?? "0"],
              ),
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
  const DriverDetailsSection({super.key, required this.driverName});
  final String? driverName;
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
  const CustomerDetailsSection({super.key, required this.order});

  final MerchantOrderItemModel order;
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
          subtitle: order.clientName ?? "--",
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsHome24Icon,
          title: "merchant.order_details.address".tr(),
          subtitle: order.address ?? "--",
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsPhone24Icon,
          title: "merchant.order_details.phone".tr(),
          subtitle: order.phone ?? "--",
          textDirection: TextDirection.ltr,
        ),
        const Gap(16),
        customCustomerDetails(
          context,
          icon: AppIcons.iconsPin24Icon,
          title: "merchant.order_details.location".tr(),
        ),
        const Gap(8),
        ShowLocationMapImage(lat: order.locationLat, lng: order.locationLng),
      ],
    );
  }

  Widget customCustomerDetails(
    BuildContext context, {
    required String icon,
    required String title,
    String? subtitle,
    TextDirection? textDirection,
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
                Text(
                  subtitle,
                  style: AppFontStyle.regular16black4B(context),
                  textDirection: textDirection,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
