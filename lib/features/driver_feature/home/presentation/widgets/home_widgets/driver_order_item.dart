import 'package:bastogah_app/core/theme/app_colors.dart';
import 'package:bastogah_app/core/theme/app_icons.dart';
import 'package:bastogah_app/features/merchant_feature/home/presentation/widgets/home_widgets/accept_order_button.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/enums/driver_filter_enum.dart';
import '../../../../../../core/routing/route_name.dart';
import '../../../../../../core/theme/app_font_style.dart';

class DriverOrderItem extends StatelessWidget {
  const DriverOrderItem({super.key, required this.currentStatus});
  final int currentStatus;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        context.push(RouteName.driverOrderDetails);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "#65488465416",
                      style: AppFontStyle.bold16Black1A(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // const Spacer(),
                const AcceptOrderButton(),
              ],
            ),
            const Gap(8),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Column(
                spacing: 30,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 30,
                          children: [
                            DeliverFrom(placeName: "برجر هاوس"),
                            DeliverTo(placeName: "برجر هاوس"),
                          ],
                        ),
                      ),
                      Gap(8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 30,
                          children: [
                            OrderValue(amount: "15000"),
                            CustomerPhone(phoneNumber: "+07701234567"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (currentStatus == DriverFilterEnum.cancelled.status)
                    const CancelReason(reason: "الزبون طلب الغاء الطلب"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliverFrom extends StatelessWidget {
  const DeliverFrom({super.key, required this.placeName});
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsPin24Icon),
        const Gap(4),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "driver.deliver_from".tr(),
                  style: AppFontStyle.regular12black4B(context),
                ),
                const Gap(4),
                Text(placeName, style: AppFontStyle.medium14black1A(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DeliverTo extends StatelessWidget {
  const DeliverTo({super.key, required this.placeName});
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsPin24Icon),
        const Gap(4),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "driver.deliver_to".tr(),
                  style: AppFontStyle.regular12black4B(context),
                ),
                const Gap(4),
                Text(placeName, style: AppFontStyle.medium14black1A(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OrderValue extends StatelessWidget {
  const OrderValue({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "driver.order_value".tr(),
            style: AppFontStyle.regular12black4B(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Gap(4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "$amount د.ع",
            style: AppFontStyle.medium14black1A(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CustomerPhone extends StatelessWidget {
  const CustomerPhone({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsPhone24Icon),
        const Gap(4),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "driver.customer_phone".tr(),
                  style: AppFontStyle.regular12black4B(context),
                ),
                const Gap(4),
                Text(
                  phoneNumber,
                  style: AppFontStyle.medium14black1A(context),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
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
