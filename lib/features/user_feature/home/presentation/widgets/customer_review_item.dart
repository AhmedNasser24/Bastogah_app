import 'package:bastogah_app/core/theme/app_font_style.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_icons.dart';

class CustomerReviewItem extends StatelessWidget {
  const CustomerReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  AppImages.imagesCustomerLogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "سعيد أحمد",
                          style: AppFontStyle.regular14black4B(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      Text("4", style: AppFontStyle.semibold14black4B(context)),
                      const Gap(4),
                      SvgPicture.asset(AppIcons.iconsStar),
                    ],
                  ),
                  Text(
                    "منذ أسبوعين",
                    style: AppFontStyle.regular10grey(context),
                  ),
                  Text(
                    "تجربة لذيذة وممتعة! كانت الأطباق لذيذة للغاية وطازجة، وخدمة العملاء كانت ممتازة. أحببت الأجواء الدافئة والمريحة في المطعم أيضًا",
                    style: AppFontStyle.regular14grey(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
