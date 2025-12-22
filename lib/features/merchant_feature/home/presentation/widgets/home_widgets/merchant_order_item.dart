import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/widgets/home_widgets/accept_order_button.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/enums/merchant_filter_enums.dart';
import '../../../../../../core/routing/route_name.dart';
import '../../../../../../core/theme/app_font_style.dart';
import '../../../data/models/order_item_model/order_item_model.dart';

class MerchantOrderItem extends StatelessWidget {
  const MerchantOrderItem({
    super.key,
    required this.currentStatus,
    required this.order,
  });
  final int currentStatus;
  final MerchantOrderItemModel order;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteName.merchantOrderDetails);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    order.billNo!,
                    style: AppFontStyle.bold16Black1A(context),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // const Spacer(),
                const AcceptOrderButton(),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 30,
                          children: [
                            CustomerPhone(phoneNumber: order.phone ?? "--"),
                            // Spacer(),
                            Driver(
                              driverName: order.driverName!.isEmpty
                                  ? "--"
                                  : order.driverName!,
                            ),
                          ],
                        ),
                      ),
                      const Gap(4),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 30,
                          children: [
                            CustomerAddress(address: order.address ?? "--"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: NetAmount(
                                    amount: order.itemsPrice.toString(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  child: DeliveryAmount(
                                    amount: order.shippingPrice.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (currentStatus == MerchantFilterEnum.cancelled.status)
                    CancelReason(reason: order.cancelReason ?? "--"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerPhone extends StatelessWidget {
  const CustomerPhone({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.customer_phone".tr(),
          style: AppFontStyle.regular12black4B(context),
        ),
        const Gap(4),
        Row(
          children: [
            SvgPicture.asset(AppIcons.iconsPhone16Icon),
            const Gap(4),
            Flexible(
              child: Text(
                phoneNumber,
                style: AppFontStyle.medium14black1A(context),
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Driver extends StatelessWidget {
  const Driver({super.key, required this.driverName});
  final String driverName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.driver".tr(),
          style: AppFontStyle.regular12black4B(context),
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(4),
        Row(
          children: [
            SvgPicture.asset(AppIcons.iconsPersonIcon),
            const Gap(4),
            Flexible(
              child: Text(
                driverName,
                style: AppFontStyle.medium14black1A(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomerAddress extends StatelessWidget {
  const CustomerAddress({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.customer_address".tr(),
          style: AppFontStyle.regular12black4B(context),
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(4),
        Row(
          children: [
            SvgPicture.asset(AppIcons.iconsPin16Icon),
            const Gap(4),
            Flexible(
              child: Text(
                address,
                style: AppFontStyle.medium14black1A(context),

                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NetAmount extends StatelessWidget {
  const NetAmount({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.net_amount".tr(),
          style: AppFontStyle.regular12black4B(context),
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(4),
        Text(
          "$amount د.ع",
          style: AppFontStyle.medium14black1A(context),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class DeliveryAmount extends StatelessWidget {
  const DeliveryAmount({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "merchant.delivery_amount".tr(),
          style: AppFontStyle.regular12black4B(context),
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(4),
        Text(
          "$amount د.ع",
          style: AppFontStyle.medium14black1A(context),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class CancelReason extends StatelessWidget {
  const CancelReason({super.key, required this.reason});
  final String reason;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppIcons.iconsCancelIcon),
        const Gap(4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "merchant.cancel_reason".tr(),
                style: AppFontStyle.regular12red(context),
              ),
              const Gap(4),
              Text(
                reason,
                style: AppFontStyle.medium14black1A(context),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
