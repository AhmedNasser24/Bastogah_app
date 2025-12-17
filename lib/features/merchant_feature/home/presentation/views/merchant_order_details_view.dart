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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderDetailsAppBar(),
              const Gap(20),
              Text(
                "merchant.customer".tr(),
                style: AppFontStyle.bold18Black4B(context),
              ),
              const Gap(20),
              CustomCustomerDetails(
                icon: AppIcons.iconsPerson24Icon,
                title: "merchant.order_details.customer_name".tr(),
                subtitle: "خالد علي",
              ),
              const Gap(16),
              CustomCustomerDetails(
                icon: AppIcons.iconsHome24Icon,
                title: "merchant.order_details.address".tr(),
                subtitle: "شارع واحد - الحي الأول - بغداد",
              ),
              const Gap(16),
              CustomCustomerDetails(
                icon: AppIcons.iconsPhone24Icon,
                title: "merchant.order_details.phone".tr(),
                subtitle: "07701234567",
              ),
              const Gap(16),
              CustomCustomerDetails(
                icon: AppIcons.iconsPin24Icon,
                title: "merchant.order_details.location".tr(),
              ),
              const Gap(8),
              const ShowLocationMapImage(),
              const Gap(20),
              Text(
                "merchant.driver".tr(),
                style: AppFontStyle.bold18Black4B(context),
              ),
              const Gap(20),
              const CustomDriverDetails(
                driverImage: AppImages.imagesCircleAvatarImage,
                driverName: "خالد علي",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDriverDetails extends StatelessWidget {
  const CustomDriverDetails({super.key, this.driverName, this.driverImage});
  final String? driverName, driverImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        driverName != null
            ? const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(AppImages.imagesCircleAvatarImage),
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
    );
  }
}

class CustomCustomerDetails extends StatelessWidget {
  const CustomCustomerDetails({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });
  final String icon, title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
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
                Text(subtitle!, style: AppFontStyle.regular16black4B(context)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
