import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_images.dart';
import '../../data/models/user_order_model.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key, this.order});
  final UserOrderModel? order;
  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Header background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // remove divider line
        ),
        child: ExpansionTile(
          splashColor: Colors.transparent,
          iconColor: AppColors.white,
          collapsedIconColor: AppColors.white,
          tilePadding: const EdgeInsets.all(0),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 12,
          ), // remove default padding
          backgroundColor: Colors.transparent, // no extra bg overlay
          collapsedBackgroundColor: Colors.transparent,
          showTrailingIcon: false,
          onExpansionChanged: (value) => setState(() {
            isExpanded = value;
            log(value.toString());
          }),
          title: Row(
            spacing: 8,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(AppImages.imagesResturantLogo),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.order?.merchantName ?? "--",
                      style: AppFontStyle.semibold14black4B(context),
                    ),
                    const Gap(4),
                    Text(
                      "user.order_id".tr(args: [widget.order?.billNo ?? '--']),
                      style: AppFontStyle.regular14grey(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteF5,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      "user.no_of_orders".tr(
                        args: [widget.order?.items?.length.toString() ?? '0'],
                      ),
                      style: AppFontStyle.regular14grey(context),
                    ),
                    const Gap(8),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),

          children: [orderItems(context, order: widget.order)],
        ),
      ),
    );
  }

  Widget orderItems(BuildContext context, {UserOrderModel? order}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: order?.items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = order?.items?[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(AppImages.imagesPizzaImage),
              ),
              const Gap(8),
              Text(
                item?.productName ?? "--",
                style: AppFontStyle.semibold14black4B(context),
              ),
              const Spacer(),
              Text(
                "user.amount".tr(args: [item?.totalPrice?.toString() ?? '0']),
                style: AppFontStyle.regular12grey(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
