import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';

class MerchantNotificationItem extends StatelessWidget {
  const MerchantNotificationItem({
    super.key,
    required this.isNew,
    required this.title,
    required this.subtitle,
  });

  final bool isNew;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: isNew
              ? const Border(
                  right: BorderSide(color: AppColors.primary, width: 4),
                )
              : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: isNew ? AppColors.primary : AppColors.whiteF5,
              child: Icon(
                Icons.notifications_none,
                color: isNew ? AppColors.white : AppColors.grey,
                size: 24,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (isNew) ...[
                        const CircleAvatar(
                          radius: 5,
                          backgroundColor: AppColors.primary,
                        ),
                        const Gap(4),
                      ],
                      Expanded(
                        child: Text(
                          title,
                          style: AppFontStyle.semibold16black1A(context),
                        ),
                      ),
                      Text(
                        "منذ 5 دقائق",
                        style: AppFontStyle.regular12grey(context),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(subtitle, style: AppFontStyle.regular14black4B(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
